# Blocklists for AdGuard Home, AdGuard, uBlock Origin, Brave Adblock, and PiHole

Blocklist of analytics and annoyances found by our own research (either discovery or found by collecting sources). 

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
[Click here](https://ihaveprivacy.com/blocklist/adguard-install.html) to add the list or follow steps below

1. Open the AdGuard `settings`
2. Navigate to `Filters`
3. Scroll down to **Custom**
4. Enable the `custom switch`
5. Click on `Custom`
6. Click `Add custom filter`
7. Paste the URL from below
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt
```
8. For the best impact enable the `trusted` checkbox
9. Click `Subscribe`

### uBlock Origin 
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
2. Click on `Brave Ad Block`
3. Click `Add filter list via URL` at the bottom of the page under `Subscribe` to filter lists 
4. Add the URL from below
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt
```
4. Press `Submit`


### PiHole
For PiHole there is a different blocklist, containing the same domains prefixed with '0.0.0.0' as localhost

1. Go to `Group Management`
2. Select `Adlist`
3. Paste the `Address` from below
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/pihole-blocklist.txt
```
4. Press `Add`

#### (OPTIONAL) To update your filters
5. Go to `Tools`/`Update Gravity`
6. Click `Update`

## Contributing
Contributing is limited to members, instructions are available in [CONTRIBUTING](CONTRIBUTING.md)
However feel free to report a website you would like to see added under [Github issues](https://github.com/ph00lt0/blocklists/issues).


## Broken sites
Feel free to report a broken website under [Github issues](https://github.com/ph00lt0/blocklist/issues/new?&template=broken-website-or-app.md). We will not remove any website because it has 'ethical' tracking, ads or whatsoever. 

