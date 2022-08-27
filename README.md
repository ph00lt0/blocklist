# Blocklists for AdGuard Home, AdGuard, Little Snitch, Open Snitch, uBlock Origin, Brave Adblock, pfBlockerNG, and PiHole

Blocklist of analytics and annoyances found by our own research (either discovery or found by collecting sources) and activively added trackers from [Tracker Radar](https://github.com/duckduckgo/tracker-radar/) by DuckDuckGo. The trackers listed by DDG contain a lot of false postives, which we try to whitelist to the best of our ability. This blocklists aims at not breaking the exerpience of apps, if this occurs please report so.

This blocklists aims at blocking:
- Stats and analytics (including privacy preserving ones such as Matomo) 
- Lottery and gambling companies
- Data brokers and data collecting companies
- Debugging trackers
- Ads
- Font content delivery networks
- Consent/cookie managment platforms
- Malware
- Spyware
- Remote Desktop Software
- Scam and fraud
<br>

Depending on where the list is used it will also block:
- Cookie banners
- Overflow blocking css
- Ad loading scripts
- Fingerprinting scripts
- Tracking scripts and pixels
- Analytical scripts
- Newsletter scripts
- Affliation scripts
- Tracking parameters
- Affiliation parameters

<br>

Recommended is to use uBlock Origin as it makes best use of the filters, as not all filters are supported by the other tools. 

For home DNS resolving Adguard Home is superior in its functionality over PiHole. 

## Instructions available for:
- [AdGuard Home](#adguard-home)
- [AdGuard](#adguard)
- [Little Snitch](#little-snitch)
- [Open Snitch](#open-snitch)
- [uBlock Origin ](#ublock-origin)
- [Brave](#brave)
- [pfBlockerNG](#pfblockerng)
- [PiHole](#pihole)

Also known to be working with:
- Dnsmasq
- Adblock Plus
- Blokada
- Rethink DNS
- DNSCloak
- InviZible
- Unbound
- OPNsense


## How to add?

### AdGuard Home
1. Go to `Filters`/`DNS blocklists`
2. Press `Add blocklist`
3. Select `Add a custom list`
4. Chose name and paste the URL from below
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt
```
5. Press `Save`


### AdGuard 
With the app it's possible to subscribe by link:
1. [Click here](https://ph00lt0.github.io/blocklist/install.html) to add the list or follow steps below
2. For the best impact enable the `trusted` checkbox
3. Click `Subscribe`

For extension/add-on or when the link does not work, follow manual steps:
1. Open the AdGuard `settings`
2. Navigate to `Filters`
3. Scroll down to **Custom**
4. Enable the `custom switch`
5. Click on `Custom`
6. Click `Add custom filter`
7. Paste the URL from below:
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt
```
8. For the best impact enable the `trusted` checkbox
9. Click `Subscribe`


### Little Snitch
1. [Click here](https://ph00lt0.github.io/blocklist/little-snitch-install.html) to add the list
2. Change `update` to daily
3. Check the `active` checkbox
4. Press `Subscribe`

If the click and install doesn't work you can also add the list manually:
1. Open `Little Snitch Rules...` from the Little Snitch icon in the **menu bar**
2. In the sidebar look for **Rule Groups** when hovering on this a `+` button appears
3. Click the `+` button
4. Paste the URL from below:
```
https://raw.githubusercontent.com/ph00lt0/blocklist/master/little-snitch-blocklist.lsrules
```
5. Press `Subscribe...`
6. Change `update` to daily
7. Check the `active` checkbox
8. Press `Subscribe`


### Open Snitch
1. Create a folder for list, create update script, crontab, and download the blocklist
```
mkdir /media/ph00lt0-blocklist/
echo "wget -O https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt -O /media/ph00lt0-blocklis/blocklist.txt" > updater.sh
chmod +x ./updater.sh
crontab -l | { cat; echo "00 11 * * * /media/ph00lt0-blocklis/updater.sh"; } | crontab -
./updater.sh
```
2. Create a new rule with **000-block-domains** as name
3. Check the boxes `Enable`, `Priority`
4. Set the **Duration** to always
5. Check `To this list of domains` and select the blocklist downloaded to your machine at:
```
/media/ph00lt0-blocklis/blocklist.txt
```
6. Press `Apply`


### uBlock Origin 
1. [Click here](https://ph00lt0.github.io/blocklist/install.html) to add the list
2. Click the `Subscribe` button

If the click and install doesn't work you can also add the list manually:
1. ⚙ Open the uBO︎ Dashboard 
2. Navigate to `Filter lists`
3. Scroll down to **+ Custom**
4. Check `Import…`
5. Paste the URL from below
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt
```
6. Click the `Apply changes` button on top of the page.


### Brave
1. Open the hamburger menu `≡`
2. Open `Settings`
3. Open `Shields` in the menu on the left
4. Open `Content filtering` at the bottom
5. Under **Add custom filter lists** paste the URL from below
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt
```
6. Click `Add`


### pfBlockerNG
#### Install pfBlockerNG in pfSense
1. In your pfSense dashboard go to  `System > Package Manager`
2. Click `Available packages` to open the tab
3. Find **pfBlockerNG** and click `install`
4. Click `confirm`
5. In your pfSense dashboard go to  `Firewall > pfBlockerNG` 
6. Follow the installation Wizard.
7. Make sure **DNS resolver** and **DNSBL blocking** are enabled under the `DNSBL` tab.

#### Add the blocklist to pfBlockerNG
1. In your pfSense dashboard go to  `Firewall > pfBlockerNG > DNSBL > DNSBL Groups` 
2. Click `Add`
3. Paste the URL from below
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/unbound-blocklist.txt
```
4. Click safe. 
5. Make sure auto updates are on, and you may force update to apply the list immediately. 


### PiHole
For PiHole there is a different blocklist, containing the same domains prefixed with '0.0.0.0' as localhost

1. Go to `Group Management`
2. Select `Adlist`
3. Paste the `Address` from below
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/pihole-blocklist.txt
```
4. Press `Add`

#### To update your filters
5. Go to `Tools`/`Update Gravity`
6. Click `Update`



## Contributing
Contributing is limited to members, instructions are available in [CONTRIBUTING](CONTRIBUTING.md)
However feel free to report a [broken website](#broken-sites).



## Broken sites
Feel free to report a broken website under [Github issues](https://github.com/ph00lt0/blocklist/issues/new?&template=broken-website-or-app.md). We will not remove any website because it has 'ethical' tracking, ads or whatsoever.



## Can you make a list available for tool 'x'?
Feel free to [open an issue](https://github.com/ph00lt0/blocklist/issues/new) with the request. 
