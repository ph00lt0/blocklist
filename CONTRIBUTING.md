# Contributing

Want to add or remove a domain from the blocklist? Just **open an issue**, that's all you need to do. You should not edit any files.

## What to Include

When opening an issue, please provide:

1. **The domain** (just `example.com`, not `https://...`)
2. **What you want** (add or remove)
3. **Why** (tracker, popup, malware, etc.)

---

## What Belongs on the Blocklist

See the [full list of what this blocklist blocks](https://github.com/ph00lt0/blocklist#what-this-blocklist-blocks) in the README. If the domain fits any of those categories, it's eligible.

### ❌ Will Not Be Added

- **Legitimate CDNs** (e.g., jQuery libraries, font hosts)
- **Essential infrastructure** (e.g., payment gateways, login systems)
- **Core website functionality** (e.g., `images.example.com` for a legitimate site)
- **Email servers** for legitimate communication

---

## Removal Policy

**Removals are exceptionally rare.** Once a domain is added, it stays on the blocklist. If a domain falls under any of the categories listed in the [README](https://github.com/ph00lt0/blocklist#what-this-blocklist-blocks), it will **not** be removed — no exceptions. This includes domains that are offline, repurposed, or claim to have changed practices.

Additionally, known issues described in the [Known Issues](https://github.com/ph00lt0/blocklist#known-issues) section will not be fixed. Don't open issues about them.

### When Removal Is Considered (Rare)

| Scenario | Evidence Required |
|----------|------------------|
| **False positive** | Clear proof the domain was never used for its alleged purpose |
| **Shared infrastructure mistake** | Proof that blocking breaks unrelated legitimate services (e.g., misidentified CDN) |

The default assumption is "block first, question later." Expect a thorough review before any removal happens.

---

## Quick Tips

- ✅ Use just the domain name (`example.com`)
- ❌ Don't include URLs (`https://example.com/page`)
- ✅ One domain per issue (keeps things organized)
- ✅ Explain why it should be added/removed

---

## After You Submit

Your issue will be reviewed and taken care of. Thanks for helping improve the blocklist!
