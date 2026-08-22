# ph00lt0 Blocklist

Comprehensive blocklist for AdGuard Home, AdGuard, Little Snitch, Open Snitch, uBlock Origin, Brave Adblock, pfBlockerNG, and PiHole

The blocklist is automatically cleaned, and kept free of dead or redundant entries. Domains are continuously discovered through multiple detection systems, including my own automated domains analyzer, as well as several threat sources. The collection is contiously being improved and extended. 

[![Repo stars](https://img.shields.io/github/stars/Ph00lt0/Blocklist?style=flat-square&label=Stars&labelColor=000&color=000)](https://github.com/Ph00lt0/Blocklist)
[![Issues](https://img.shields.io/github/issues/Ph00lt0/Blocklist?style=flat-square&label=Issues&labelColor=000&color=000)](https://github.com/Ph00lt0/Blocklist/issues)

[![Domains Blocked](https://img.shields.io/badge/dynamic/json?url=https://raw.githubusercontent.com/Ph00lt0/Blocklist/master/stats.json&query=$.domains&label=Domains%20Blocked&style=flat-square&labelColor=000&color=000)](https://github.com/Ph00lt0/Blocklist/blob/master/domains.txt)
[![Last updated](https://img.shields.io/github/last-commit/Ph00lt0/Blocklist/master?style=flat-square&label=Last%20Updated&labelColor=000&color=000)](https://github.com/Ph00lt0/Blocklist/commits/master)
[![Repo Size](https://img.shields.io/github/repo-size/Ph00lt0/Blocklist?style=flat-square&label=Repo%20Size&labelColor=000&color=000)](https://github.com/Ph00lt0/Blocklist)
[![File Size](https://img.shields.io/github/size/Ph00lt0/Blocklist/blocklist.txt?style=flat-square&label=File%20Size&labelColor=000&color=000)](https://github.com/Ph00lt0/Blocklist/blob/master/blocklist.txt)

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
- 🌐 **Ad Networks & Servers** — Third-party ad serving domains and ad delivery infrastructure
- 🏗️ **Programmatic Bidding Infrastructure** — DSPs, SSPs, ad exchanges, and real-time bidding endpoints
- 🖼️ **Retargeting & Audience Matching** — Cross-site ad tracking and behavioral profiling networks
- 📰 **Social Widgets** — Like, share, and embed buttons that track users regardless of interaction
- ✍️ **Font & Image Trackers** — Embedded resources used for browser fingerprinting
- ⛏️ **Cryptojacking** — Browser-based cryptocurrency mining scripts
- 🔀 **Browser Hijackers** — Extensions and settings that redirect traffic without consent
- 🦠 **Malware** — Malicious software and viruses
- 🖥️ **Remote Administration Tools** — RATs, software to control a device remotely, often used in scams
- 🎣 **Phishing Campaigns** — Domains attempting to scam you
- 💊 **Health & Medical Scams** — Fake remedies, supplement fraud, and telehealth scams
- 🛠️ **Tech Support Scams** — Popups and sites pretending to offer IT assistance
- 💰 **Investment & Crypto Scams** — Fraudulent trading platforms, Ponzi schemes, and fake exchanges
- 🎰 **Gambling and Lottery** — Domains associated with gambling and lottery scams
- 💌 **Romance & Impersonation Scams** — Dating platforms and profiles used for financial fraud
- 🎁 **Survey & Sweepstakes Scams** — Fake prize claims and reward programs
- 📬 **Email Spam Domains** — Known senders of unsolicited bulk email
- 📩 **Spam Domains** — General spam infrastructure and bulk senders
- 💿 **Shareware & Fake Downloads** — Cracked software, fake installers, and bundled unwanted programs
- 🧱 **Bloatware & Trialware** — Pre-installed or bundled unnecessary software
- 🤖 **AI Data Harvesting** — LLM interfaces and services that train on or sell user inputs


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

## Installation Guides

### uBlock Origin

**Easiest method:**
1. [Click here](https://ph00lt0.github.io/blocklist/install.html) to add automatically
2. Click the Subscribe button

**Manual method:**
1. Open the uBO Dashboard
2. Navigate to Filter lists
3. Scroll down to + Custom
4. Check Import...
5. Paste: https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt
6. Click Apply changes

---

### AdGuard Home

1. Go to Filters > DNS blocklists
2. Click Add blocklist
3. Select Add a custom list
4. Choose a name and paste:
   https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt
5. Click Save

---

### AdGuard

**Automatic method:**
1. [Click here](https://ph00lt0.github.io/blocklist/install.html) to subscribe
2. For best results, enable the trusted checkbox
3. Click Subscribe

**Manual method:**
1. Open AdGuard Settings
2. Navigate to Filters > Custom
3. Enable the custom switch
4. Click Add custom filter
5. Paste: https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt
6. Enable trusted checkbox
7. Click Subscribe

---

### Little Snitch

1. [Click here](https://ph00lt0.github.io/blocklist/little-snitch-install.html) to add the list
2. Allow your browser to open Little Snitch
3. Verify update frequency is set to daily and list is active
4. Press Add

---

### Brave

1. Go to: brave://adblock
2. Under Add custom filter lists, paste:
   https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt
3. Click Add

---

### PiHole

PiHole uses a different format (hosts blocklist):

1. Go to Group Management > Adlist
2. Paste the URL:
   https://raw.githubusercontent.com/ph00lt0/blocklist/master/hosts-blocklist.txt
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
3. Paste: https://raw.githubusercontent.com/ph00lt0/blocklist/master/unbound-blocklist.txt
4. Click Save
5. Enable auto-updates and force update if needed

---

### Open Snitch

**Note: Script auto-update setup**

1. Create a folder and download script:
   ```zsh
   mkdir -p /media/ph00lt0-blocklist/
   wget https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt -O /media/ph00lt0-blocklist/blocklist.txt
   ```

2. Add to crontab for daily updates:
   ```zsh
   crontab -l | { cat; echo "00 11 * * * /usr/bin/wget https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt -O /media/ph00lt0-blocklist/blocklist.txt"; } | crontab -
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
> RethinkDNS does update the blocklists only every 8 days which limits the effectiveness against malicious domains and phishing.

**DOT (DNS over TLS):**
   https://sky.rethinkdns.com/1:oAIIAACAIAA=

**DOH (DNS over HTTPS):**
   http://1-uabaqaaaqaqaa.max.rethinkdns.com/

**MobileConfig (Apple Devices):**
1. [Click here](https://ph00lt0.github.io/blocklist/rethinkdns.mobileconfig) to download
2. Open Settings/Preferences
3. Tap Profile Downloaded
4. Tap Install and follow onscreen instructions

---

### NextDNS
NextDNS doesn't natively support this list, but you can automatically sync it to your profiles using the [custom NextDNS denylist updater](https://github.com/ph00lt0/custom-blocklists-nextdns-updater) — a GitHub Actions workflow that imports and prunes stale entries daily:

1. Fork the [repository](https://github.com/ph00lt0/custom-blocklists-nextdns-updater)
2. Add your NextDNS API key as a repository secret (`NEXTDNS_ACCOUNT_1_API_KEY`)
3. Run the workflow — it syncs all your profiles automatically

See the [README](https://github.com/ph00lt0/custom-blocklists-nextdns-updater) for full setup instructions.

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

## License

- Source code: MIT License
- Content/data: Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)




