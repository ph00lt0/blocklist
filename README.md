# ph00lt0 Blocklist

Comprehensive blocklist for AdGuard Home, AdGuard, Little Snitch, Open Snitch, uBlock Origin, Brave Adblock, pfBlockerNG, and PiHole

[![Stars](https://img.shields.io/github/stars/ph00lt0/blocklist?style=social)](https://github.com/ph00lt0/blocklist)
[![Issues](https://img.shields.io/github/issues/ph00lt0/blocklist)](https://github.com/CaptainCodeAU/littlesnitch_blocklist/issues)
[![Last Commit](https://img.shields.io/github/last-commit/ph00lt0/blocklist)](https://github.com/ph00lt0/blocklist/commits)

---

## What This Blocklist Blocks

This blocklist is specifically designed to block:

- 🔍 **Analytics & Tracking** — Google Analytics, Mixpanel, Segment, TikTok and Facebook Pixels, and more
- 📊 **Stats Platforms** — Data collection and profiling services
- 🍪 **Cookie & Consent Management** — Forced consent banners and cookie walls
- 🐛 **Debugging Trackers** — Sentry, LogRocket, and similar tools collecting your data not always in secure ways
- 🎯 **Data Brokers** — Companies that collect and sell personal data
- 🔗 **Tracking Parameters** — UTM, affiliate, and click-tracking parameters removed
- 💄 **Cosmetic Filters** — Cookie banner elements hidden and removing buttons to accidentally consent via dark patterns
- 📧 **Newsletter and Chatbot Popups** — Subscription request overlays and annoying AI chatbot experiences
- 🦠 **Malware** — Malicious software and viruses
- 🖥️ **Remote Administration Tools** — RATs, software to control a device remotely, often used in scams
- 🎣 **Phishing Campaigns** — Domains attempting to scam you
- 🎰 **Gambling and Lottery** — Domains associated with gambling and lottery scams

---

## Known Issues

> [!WARNING]
> This blocklist **prioritizes privacy over convenience**. That is intentional.

This blocklist **may break functionality** for:

- Facebook
- TikTok
- Amazon Alexa
- Link shorteners
- Email tracking

See [Troubleshooting](#troubleshooting) below for whitelisting instructions if you encounter issues.

---

## Quick Start

Choose your tool and follow the setup guide:

| Tool | Status | Guide |
|------|--------|-------|
| **uBlock Origin** | ✅ Recommended | [Setup](#ublock-origin) |
| **AdGuard Home** | ✅ Recommended | [Setup](#adguard-home) |
| **AdGuard** | ✅ Full Support | [Setup](#adguard) |
| **Little Snitch** | ✅ Recommended | [Setup](#little-snitch) |
| **Brave** | ✅ Recommended | [Setup](#brave) |
| **PiHole** | ✅ Full Support | [Setup](#pihole) |
| **Open Snitch** | ✅ Full Support | [Setup](#open-snitch) |
| **pfBlockerNG** | ✅ Full Support | [Setup](#pfblockerng) |
| **RethinkDNS** | ✅ Slow Updates | [Setup](#rethinkdns) |
| **NextDNS** | ⚠️ Via API | [Setup](#nextdns) |

Also works with: Dnsmasq · Adblock Plus · Blokada · DNSCloak · InviZible · Unbound · OPNsense

---

## Recommended Configuration

For best results, use this blocklist across **3 filtering levels**:

### Browser Level
- **uBlock Origin** (best support)
- Brave's native adblock

### Device Level
- **Little Snitch** (macOS)
- **Open Snitch** (Linux)

### Network Level (DNS)
- **AdGuard Home** (self-hosted)
- PiHole (Raspberry Pi)
- NextDNS (via import to denylist)

**Combine with:**
- [Hagezi Multi Pro++](https://github.com/hagezi/dns-blocklists)
- [OISD Big](https://oisd.nl/setup/0)

---

## Available Formats

This repository generates multiple formats for different tools:

| File | Format | Best For |
|------|--------|----------|
| `blocklist.txt` | Adblock/uBlock | Browsers, AdGuard |
| `domains.txt` | Plain domains | DNS, NextDNS |
| `hosts-blocklist.txt` | Hosts format | PiHole, localhost blocking |
| `pihole-blocklist.txt` | PiHole format | Pi-hole DNS |
| `rpz-blocklist.txt` | RPZ format | BIND, Unbound |
| `unbound-blocklist.txt` | Unbound format | Unbound, pfBlockerNG |
| `wildcard-blocklist.txt` | Wildcard domains | DNS servers |
| `little-snitch-blocklist.lsrules` | Little Snitch | macOS firewall |

---

## Installation Guides

### uBlock Origin

**Easiest method:**
1. [Click here](https://captaincodeau.github.io/littlesnitch_blocklist/install.html) to add automatically
2. Click the Subscribe button

**Manual method:**
1. Open the uBO Dashboard
2. Navigate to Filter lists
3. Scroll down to + Custom
4. Check Import...
5. Paste: https://raw.githubusercontent.com/CaptainCodeAU/littlesnitch_blocklist/master/blocklist.txt
6. Click Apply changes

---

### AdGuard Home

1. Go to Filters > DNS blocklists
2. Click Add blocklist
3. Select Add a custom list
4. Choose a name and paste:
   https://raw.githubusercontent.com/CaptainCodeAU/littlesnitch_blocklist/master/blocklist.txt
5. Click Save

---

### AdGuard

**Automatic method:**
1. [Click here](https://captaincodeau.github.io/littlesnitch_blocklist/install.html) to subscribe
2. For best results, enable the trusted checkbox
3. Click Subscribe

**Manual method:**
1. Open AdGuard Settings
2. Navigate to Filters > Custom
3. Enable the custom switch
4. Click Add custom filter
5. Paste: https://raw.githubusercontent.com/CaptainCodeAU/littlesnitch_blocklist/master/blocklist.txt
6. Enable trusted checkbox
7. Click Subscribe

---

### Little Snitch

1. [Click here](https://captaincodeau.github.io/littlesnitch_blocklist/little-snitch-install.html) to add the list
2. Allow your browser to open Little Snitch
3. Verify update frequency is set to daily and list is active
4. Press Add

---

### Brave

1. Go to: brave://adblock
2. Under Add custom filter lists, paste:
   https://raw.githubusercontent.com/CaptainCodeAU/littlesnitch_blocklist/master/blocklist.txt
3. Click Add

---

### PiHole

PiHole uses a different format (hosts blocklist):

1. Go to Group Management > Adlist
2. Paste the URL:
   https://raw.githubusercontent.com/CaptainCodeAU/littlesnitch_blocklist/master/hosts-blocklist.txt
3. Click Add
4. Go to Tools > Update Gravity > Update

---

### pfBlockerNG

**Install pfBlockerNG in pfSense:**
1. Go to System > Package Manager
2. Click Available packages
3. Find pfBlockerNG and click install
4. In pfSense dashboard: Firewall > pfBlockerNG
5. Follow the installation wizard
6. Enable DNS resolver and DNSBL blocking under DNSBL tab

**Add the blocklist:**
1. Go to Firewall > pfBlockerNG > DNSBL > DNSBL Groups
2. Click Add
3. Paste: https://raw.githubusercontent.com/CaptainCodeAU/littlesnitch_blocklist/master/unbound-blocklist.txt
4. Click Save
5. Enable auto-updates and force update if needed

---

### Open Snitch

**Note: Script auto-update setup**

1. Create a folder and download script:
   ```zsh
   mkdir -p /media/ph00lt0-blocklist/
   wget https://raw.githubusercontent.com/CaptainCodeAU/littlesnitch_blocklist/master/blocklist.txt -O /media/ph00lt0-blocklist/blocklist.txt
   ```

2. Add to crontab for daily updates:
   ```zsh
   crontab -l | { cat; echo "00 11 * * * /usr/bin/wget https://raw.githubusercontent.com/CaptainCodeAU/littlesnitch_blocklist/master/blocklist.txt -O /media/ph00lt0-blocklist/blocklist.txt"; } | crontab -
   ```

3. In Open Snitch UI:
   - Create new rule: 000-block-domains
   - Check Enable and Priority
   - Set Duration to always
   - Check To this list of domains
   - Select: /media/ph00lt0-blocklist/blocklist.txt
   - Click Apply

---

### RethinkDNS

> [!WARNING]
> RethinkDNS does not update the blocklists regulary which limits the effectiveness.

**DOT (DNS over TLS):**
   https://sky.rethinkdns.com/1:oAIIAACAIAA=

**DOH (DNS over HTTPS):**
   http://1-uabaqaaaqaqaa.max.rethinkdns.com/

**MobileConfig (Apple Devices):**
1. [Click here](https://captaincodeau.github.io/littlesnitch_blocklist/rethinkdns.mobileconfig) to download
2. Open Settings/Preferences
3. Tap Profile Downloaded
4. Tap Install and follow onscreen instructions

---

### NextDNS
NextDNS doesn't natively support this list, but you can import it via API using nextdnsctl:
```zsh
pip install nextdnsctl nextdnsctl 
login 
nextdnsctl denylist import <profile> https://raw.githubusercontent.com/CaptainCodeAU/littlesnitch_blocklist/master/domains.txt
```

---

---

## Troubleshooting

If a website or app breaks after enabling this blocklist:

| Problem | Solution |
|---------|----------|
| Site not loading | Temporarily disable blocklist to confirm |
| Login fails | Whitelist authentication domains |
| Video won't play | Check tracker filters (analytics may block playback) |
| Maps broken | Add geolocation domains to allowlist |
| Social media features fail | These are expected (Facebook, TikTok intentionally blocked) |

### How to Whitelist

- **uBlock Origin**: Right-click element > "Never block" or go to Dashboard > Whitelist
- **AdGuard**: Settings > Filters > Whitelist > Add domain
- **PiHole**: Group Management > Clients > Add whitelist entries
- **Little Snitch**: Create allow rule for specific domains/processes

---

## Reporting Issues

Found a broken website or want to suggest improvements?

- [Report a broken site](https://github.com/CaptainCodeAU/littlesnitch_blocklist/issues/new?template=broken-website-or-app.md)
- [Request a feature](https://github.com/CaptainCodeAU/littlesnitch_blocklist/issues/new)

---

## Safety Disclaimer

> [!WARNING]
> This blocklist improves privacy and security, but isn't foolproof. Combine with updated software, and security awareness for best protection. No blocklist can catch everything. Stay vigilant. 

---

## License

- Source code: MIT License
- Content/data: Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)




