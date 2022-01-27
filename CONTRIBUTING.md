#Getting started

## Use both repositories

```
git clone git@gitlab.com:ph00lt0/blocklists.git
cd blocklists
git remote add github git@github.com:ph00lt0/blocklists.git
```


# Add domain

```
./insert.sh
```

Enter the domain name without https:// or http and no trailing /
So https://annoyingtrackers.com/ becomes: annoyingtrackers.com

Hit enter, and the domain will be added to the list.
