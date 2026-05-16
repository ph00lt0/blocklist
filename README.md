# Blocklists for AdGuard Home, AdGuard, Little Snitch, Open Snitch, uBlock Origin, Brave Adblock, pfBlockerNG, and PiHole

Blocklist of analytics and annoyances found by our own research (either discovery or found by collecting sources). The trackers listed by DDG contain a lot of false postives, which we try to whitelist to the best of our ability. This blocklists aims at not breaking the exerpience of apps, if this occurs please report so.

We recommend against using the AdGuard DNS filter, they whitellist many tracking domains using @@ which overwrite your settings in the name of functionality. They allow for trackers in emails links and page ads in search results, something we do not compromise for.

This blocklist aims to block a variety of unwanted categories, including advertising and tracking tools like ads, stats and analytics, consent/cookie management platforms, debugging trackers; data collection and privacy risks posed by data brokers and data collecting companies such as surveys, as well as domains used in email spam activity; security threats such as malware, remote desktop software, phishing attempts, and spyware; scams and fraud, including quackery and lottery and gambling companies;

<br>

Depending on where the list is used it will also block cookie banners, overflow blocking css, ad loading scripts, more fingerprinting scripts tracking scripts and pixels, analytical scripts, newsletter scripts, affliation scripts, tracking parameters and affiliation and tracking parameters.

<br>

This blocklist is causing issues if you are a user of Facebook, TikTok, Amazon Alexa, link shorters and tracking links in emails. Blocklist prioritizes blocking spyware over your usage of spyware. If you use these privacy invasive services you are NOT quite the target audience of this list.


## Recommended usage:
Recommended is to use uBlock Origin as it makes best use of the filters, as not all filters are supported by the other tools.

For home DNS resolving Adguard Home is superior in its functionality over PiHole due to f.x. support for DOH. 

Ideally you want to filter on 3 levels: browser (by Ublock Origin or natively in Brave, Device Firewall like Little Snitch and Network level DNS).

On DNS level I recommend to use this lists in combination with [Hagezi' Multi Pro++](https://github.com/hagezi/dns-blocklists) and [OISD Big](https://oisd.nl/setup/0). 


## Instructions available for:
- [AdGuard Home](#adguard-home)
- [AdGuard](#adguard)
- [Little Snitch](#little-snitch)
- [Open Snitch](#open-snitch)
- [uBlock Origin ](#ublock-origin)
- [Brave](#brave)
- [pfBlockerNG](#pfblockerng)
- [PiHole](#pihole)
- [RethinkDNS](#rethinkdns)

Also known to be working with:
- Dnsmasq
- Adblock Plus
- Blokada
- DNSCloak
- InviZible
- Unbound
- OPNsense

NextDNS has been requested a lot. I opened a [PR](https://github.com/nextdns/blocklists/pull/170) for them, but it is up to NextDNS to add support. 

## How to add?

### AdGuard Home
1. Go to `Filters`/`DNS blocklists`
2. Press `Add blocklist`
3. Select `Add a custom list`
4. Chose name and paste the URL from below
```
https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt
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
https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt
```
8. For the best impact enable the `trusted` checkbox
9. Click `Subscribe`


### Little Snitch
1. [Click here](https://ph00lt0.github.io/blocklist/little-snitch-install.html) to add the list
2. Allow your browser to open the Little Snitch app when asked
3. Verify that update frequency is set to `daily` and list is `active`
4. Press `Add`


### Open Snitch
1. Create a folder for list, create update script, crontab, and download the blocklist
```
mkdir /media/ph00lt0-blocklist/
echo "wget -O https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt -O /media/ph00lt0-blocklis/blocklist.txt" > updater.sh
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
https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt
```
6. Click the `Apply changes` button on top of the page.


### Brave
1. Go to;
```
brave://adblock
```
5. Under **Add custom filter lists** paste the URL from below
```
https://raw.githubusercontent.com/ph00lt0/blocklist/master/blocklist.txt
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
https://raw.githubusercontent.com/ph00lt0/blocklist/master/unbound-blocklist.txt
```
4. Click safe. 
5. Make sure auto updates are on, and you may force update to apply the list immediately. 


### PiHole
For PiHole there is a different blocklist, containing the same domains prefixed with '0.0.0.0' as localhost

1. Go to `Group Management`
2. Select `Adlist`
3. Paste the `Address` from below
```
https://raw.githubusercontent.com/ph00lt0/blocklist/master/hosts-blocklist.txt
```
4. Press `Add`


#### To update your filters
5. Go to `Tools`/`Update Gravity`
6. Click `Update`



### RethinkDNS
The recommended configuration would the via DOT, DOH or preconfigured MobileConfig.

#### DOT
```
https://sky.rethinkdns.com/1:oAIIAACAIAA=
```

#### DOH
```
http://1-uabaqaaaqaqaa.max.rethinkdns.com/
```

#### MobileConfig (Apple Devices)
1. Click [here](https://ph00lt0.github.io/blocklist/rethinkdns.mobileconfig) to download
2. Open the Settings/Preferences app.
3. Tap Profile Downloaded
4. Tap Install in the upper-right corner, then follow the onscreen instructions.


## Contributing
Contributing is limited to members, instructions are available in [CONTRIBUTING](CONTRIBUTING.md)
However feel free to report a [broken website](#broken-sites).


## Donations
XMR
```
44MEFUq1BwnSgJ3ooy4B5yH7zLSPNtWxLYEHYrdiBuKdaqoFjNBovBD3t86dYRUuVn1dTKCudXZeDeafJG6xgtg7LhG7u6U
```


BTC
```
bc1qptcdcgnspfcasdaj3m6532aue6qrtrh4x2c9yq
```



## Broken sites
Feel free to report a broken website under [Github issues](https://github.com/ph00lt0/blocklist/issues/new?&template=broken-website-or-app.md). We will not remove any website because it has 'ethical' tracking, ads or whatsoever.



## Can you make a list available for tool 'x'?
Feel free to [open an issue](https://github.com/ph00lt0/blocklist/issues/new) with the request. 
