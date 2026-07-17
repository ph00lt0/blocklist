<!-- Copilot instructions for contributors and AI coding agents -->
# Copilot / AI agent instructions — blocklist

Purpose: make a new AI coding agent productive quickly in this repo by describing the
architecture, developer workflows, important conventions, and concrete examples.

- **Big picture**: The canonical source is the repository root `blocklist.txt`. Small CLI scripts in the repo root (e.g. `cleanup.py`, `insert.py`, `import.py`, `badfilter.py`) mutate or generate derived artifacts. The `modules/` package contains reusable logic (validation, formatting, update/export).

- **Primary data flow**:
  - Authors edit `blocklist.txt` (source-of-truth).
  - Run `cleanup.py` to normalize, remove duplicates and regenerate downstream outputs.
  - `modules/update.py:update_blocklists()` extracts first-party domains and writes derived files such as `domains.txt`, `rpz-blocklist.txt`, `hosts-blocklist.txt`, `pihole-blocklist.txt`, `unbound-blocklist.txt`, `wildcard-blocklist.txt`, and `little-snitch-blocklist.lsrules`.

- **Key files**:
  - [blocklist.txt](../blocklist.txt) — canonical input list (headers begin with `! ` and are preserved).
  - [header.txt](../header.txt) — header text injected into all generated lists by `modules/update.py`.
  - [modules/clean.py](../modules/clean.py) — `format_record()` and `cleanup_file()` implement canonical normalization rules.
  - [modules/validate.py](../modules/validate.py) — central validation rules for acceptable records.
  - [modules/update.py](../modules/update.py) — exports domain lists in multiple formats.
  - CLI scripts: `cleanup.py` (clean + update), `insert.py` (append records interactively), `import.py` (import from file), `badfilter.py` (mark existing records `$badfilter`).

- **How to run (dev workflows)**:
  - Create / use virtualenv and install deps:

    python3 -m venv blocklist
    source blocklist/bin/activate
    pip install -r requirements.txt

  - Quick common commands:

    - Clean + regenerate all derived lists: `python3 cleanup.py`
    - Insert one or more records interactively: `python3 insert.py example.com` or `python3 insert.py` then type records
    - Bulk import from file: `python3 import.py path/to/file.txt`
    - Mark records as badfilter: `python3 badfilter.py example.com`

- **Project-specific conventions & patterns**:
  - Records use Adblock/uBlock-style syntax: domains are normalized to the `||domain^` form; whitelist entries use `@@` prefix; special element/cosmetic rules are accepted (see `modules/validate.py`).
  - `modules/clean.py:format_record()` contains the exact normalization rules to follow for new code that touches record strings — reuse it rather than ad-hoc string ops.
  - `can_be_added()` in `modules/status.py` checks against the full text of `blocklist.txt` to prevent duplicates, whitelists, or `$badfilter` entries — any insertion code should call it.
  - Headers: lines starting with `! ` are treated as metadata and preserved by `cleanup_file()`.

- **Integration points & outputs**:
  - Generated outputs are in repository root and are consumed externally by DNS and firewall tools (PiHole, AdGuard, Little Snitch). The export logic lives in `modules/update.py` — modify formats there when adding new targets.

- **Dependencies & environment notes**:
  - Declared in `requirements.txt`: `dnspython`, `pyfiglet`, `python-whois`, `validators`, etc.
  - Some validation attempts use network lookups (DNS / whois). Tests or CI should avoid hitting the network; prefer mocking `modules.validate.is_registered` when writing unit tests.

- **Guidance for edits and PRs**:
  - Prefer small, focused changes that preserve `blocklist.txt` semantics.
  - When changing normalization rules, update `modules/clean.py:format_record()` and add a short example in tests or the PR description showing before/after for 2–3 representative records.
  - When adding a new export format, add it in `modules/update.py` and include a sample output file in a `samples/` directory for review.

- **Examples to reference while coding**:
  - Use `format_record()` before validating or writing records (see [insert.py](../insert.py) and [import.py](../import.py)).
  - Use `update_blocklists()` to regenerate outputs (called by `cleanup.py`).

If any section is unclear or you'd like more examples (e.g., representative before/after normalization cases or a small test harness), tell me which part to expand and I will iterate.
