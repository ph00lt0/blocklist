import re
import dns.resolver
import requests

BLOCKLIST = "blocklist.txt"
OUTPUT = "candidates_for_removal.txt"
IANA_TLDS_URL = "https://data.iana.org/TLD/tlds-alpha-by-domain.txt"

# --- Load valid TLDs from IANA ---
iana_tlds = {
    line.strip().lower()
    for line in requests.get(IANA_TLDS_URL).text.splitlines()
    if line and not line.startswith("#")
}

# RFC-ish domain regex (labels, dots, no leading/trailing hyphen)
DOMAIN_RE = re.compile(
    r"^(?!-)[A-Za-z0-9-]{1,63}(?<!-)(\.[A-Za-z0-9-]{1,63})+$"
)

MODIFIER_KEYWORDS = (
    "$removeparam",
    "$csp",
    "$redirect",
    "$rewrite",
    "$removeheader",
    "$header",
    "$cookie",
    "$queryprune",
    "$badfilter",
    "$third-party",
    "$domain",
)

IP_RE = re.compile(r"^\d{1,3}(\.\d{1,3}){3}$")


def extract_domain(line: str) -> str | None:
    line = line.strip()

    # Comments / empty
    if not line or line.startswith(("!", "#", "//",)):
        return None

    # Pure modifier rules and file rules (no host)
    if line.startswith("$"):
        return None
    
    # File filter and 
    if line.startswith(("^", "@@^")):
        return None
    
    # pattern urls
    if "*" in line:
        return None

    # Whitelisting rules
    if line.startswith("@@||"):
        return None

    # Cosmetic filters
    if "##" in line or "#@" in line:
        return None

    # If it contains known modifier keywords but no obvious host pattern,
    # treat it as a non-domain rule (e.g. *$removeparam=...).
    if any(k in line for k in MODIFIER_KEYWORDS):
        if not line.startswith("||") and not line.startswith(("|http://", "|https://")):
            return None

    # uBO / Adblock network filters

    # ||example.com^
    if line.startswith("||"):
        core = line[2:]
        core = core.split("^", 1)[0]
        core = core.split("/", 1)[0]
        return core.lower() or None

    # |http://example.com^ or |https://example.com^
    if line.startswith("|http://") or line.startswith("|https://"):
        core = line[1:]  # drop leading |
        core = core.split("://", 1)[1]
        core = core.split("^", 1)[0]
        core = core.split("/", 1)[0]
        return core.lower() or None

    # Hosts file style: "0.0.0.0 example.com"
    parts = line.split()
    if len(parts) >= 2 and IP_RE.match(parts[0]):
        return parts[1].lower()

    # If the line contains a "$" but we got here, it's likely a rule with modifiers
    # but no clear host pattern we support → skip to avoid false positives.
    if "$" in line:
        return None

    # Plain domain line (no modifiers, no IP, no cosmetics)
    return line.lower()


def is_valid_syntax(domain: str) -> bool:
    return bool(DOMAIN_RE.match(domain))


def has_valid_tld(domain: str) -> bool:
    tld = domain.split(".")[-1]
    return tld.lower() in iana_tlds


def resolves(domain: str) -> bool:
    for rtype in ("A", "AAAA", "MX", "CNAME"):
        try:
            dns.resolver.resolve(domain, rtype)
            return True
        except Exception:
            pass
    return False


def main():
    candidates: list[str] = []

    with open(BLOCKLIST, encoding="utf-8") as f:
        for raw in f:
            raw = raw.rstrip("\n")
            dom = extract_domain(raw)
            if dom is None:
                continue  # comment / cosmetic / modifier / non-domain rule

            reason = None
            if not is_valid_syntax(dom):
                reason = "invalid syntax"
            elif not has_valid_tld(dom):
                reason = "invalid TLD"
            elif not resolves(dom):
                reason = "does not resolve"

            if reason:
                candidates.append(f"{raw}")

    with open(OUTPUT, "w", encoding="utf-8") as f:
        if candidates:
            f.write("\n".join(candidates) + "\n")
        else:
            f.write("# no candidates\n")


if __name__ == "__main__":
    main()
