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


## AdGuard Home
Add this domain to AdGuard Home:
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt
```


## AdGuard 
- Open the AdGuard settings
- Navigate to `Filters`
- Scroll down to **Custom**
- Enable the custom `switch`
- Click on `Custom`
- Click **Add custom filter**
- Paste the URL below
- For the best impact enable the `trusted` checkbox
- Click **Subscribe**

```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt
```


## uBlock Origin 
- Open the uBO Dashboard
- Navigate to `Filter lists`
- Scroll down to **Custom**
- Check `Import…`
- Paste the URL below
- Click the `Apply changes` button on top of the page.
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt
```

## Brave
- Navigate to `brave://adblock/`
- Click `Add filter list via URL` at the bottom of the page under **Subscribe** to filter lists
- Add the URL below and press `Submit`
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/blocklist.txt

```


## PiHole
For PiHole there is a different blocklist, containing the same domains prefixed with '0.0.0.0' as localhost
```
https://raw.githubusercontent.com/ph00lt0/blocklists/master/pihole-blocklist.txt
```


## Contributing
Contributing is limited to members, instructions are available in [CONTRIBUTING](CONTRIBUTING.md)
However feel free to report a website you would like to see added under [Github issues](https://github.com/ph00lt0/blocklists/issues).


## Broken sites
Feel free to report a broken website under [Github issues](https://github.com/ph00lt0/blocklists/issues). We will not remove any website because it has 'ethical' tracking, ads or whatsoever. 

