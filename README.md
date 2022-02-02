# Blocklists for Adguard Home, uBlock Origin and PiHole

Blocklist of analytics and annoyances found by our own research (either discovery or found by collecting sources). 

This blocklists aims at blocking:
- Stats and analytics (including privacy preserving ones such as Matomo) 
- Lotttery
- Data brokers and data collecting companies
- Debugging trackers
- Ads
- Font content delivery networks
- Consent/cookie managment platforms
- Malware
- Spyware


## Adguard Home
Add this domain to Adguard Home:
```
https://gitlab.com/ph00lt0/blocklists/-/raw/master/blocklist.txt
```


## uBlock Origin 
uBlock Origin does not seem to work with Gitlab's raw file for some vague reason. You can add;
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

