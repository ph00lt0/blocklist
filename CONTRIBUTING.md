# Getting started

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

Enter the domain name, https:// or http and trailing / are automatically being removed if included.
So https://annoyingtrackers.com/ becomes: annoyingtrackers.com

Hit enter, and the domain will be added to the list.



# Delist a domain

```
./delist.sh
```

- Enter the domain name, https:// or http and trailing / are automatically being removed if included.
- Specify reason

Hit enter, and the domain will be delisted and specification will be added to the list for reference.



# Made a mistake?

```
./delete.sh
```

Enter the same entry you made by mistake, https:// or http and trailing / are automatically being removed if included.

Hit enter, and the mistake will be corrected, the commit message will blame you for it and you can continue your life.

# Remove a URL parameter
```
./insert-filter-remove-parameter.sh
```
OR
```
insert-filter-remove-parameter-domain.sh
```
Carefully choose whether to remove a parameter from only a single domain or globally. A clear tracker can be removed from all websites, but a UID may be required for some websites to operate. Generic UID names should not be removed globally.

Depending on the script enter the domain name and the parameter to remove. The script will do the rest.

# Remove element by class or id
```
./insert-filter-remove-element.sh
```
- Enter the domain
- Enter the identifier, following given instructions

Hit enter, and the rule will be added to the blocklist. Note that this won't be in the pihole blocklist and work for DNS only filters


# Add filter to remove a class from element
```
./insert-filter-remove-class.sh 
```

Do you want to remove a class from an element? For example a class making the body disappear to show a cookie banner?

- Enter the domain name, the class, and the element to remove it from

Hit enter, and the class removal rule will be added
Note that all rules are set to stay active, so that they will continue to work on page refreshes as well as with async content.


# Add filter to remove hidden overflow 
```
./insert-filter-remove-overflow-hidden.sh
```

- Enter the domain name

Hit enter, and the hidden overflow will be removed from the body



# Got an error pushing upstream?
This is likely due to you commiting just at the same time someone else is pushing upstream. You can use the following command to retry adding a domain rather then fixing the merge conflict manually.
```
./reattempt.sh
```
After this following the insertion instructions: enter a domain, hit enter, and the domain will be added to the list.
