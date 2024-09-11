# Getting started

## Use both repositories

```zsh
git clone git@gitlab.com:ph00lt0/blocklists.git
cd blocklists
git remote add github git@github.com:ph00lt0/blocklists.git
```

## Init project

```zsh
python3 -m venv blocklist
source blocklist/bin/activate
pip install -r requirements.txt
# add simple command to open project and venv by just typing block
echo "$(pwd)" > ~/.blocklist
echo "alias block='cd \$(cat ~/.blocklist) && source \$(cat ~/.blocklist)/blocklist/bin/activate'" >> ~/.zshrc
echo "alias block='cd \$(cat ~/.blocklist) && source \$(cat ~/.blocklist)/blocklist/bin/activate'" >> ~/.bashrc
echo "python cleanup.py" > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

## Insert

```zsh
block
python insert.py
```

Insert supports, domains and filepaths.

If you enter a domain name, https:// or http and trailing / are automatically being removed if included.
So https://annoyingtrackers.com/ becomes: annoyingtrackers.com

Hit enter, and the domain will be added to the list.

## Badlist

```zsh
block
python badlist.py
```

Badlist supports filepaths and domains.

## Made a mistake?

Make your changes in blocklist.txt and commit.

## Remove a URL parameter (legacy)

```zsh
./insert-filter-remove-parameter.sh
```

OR

```zsh
insert-filter-remove-parameter-domain.sh
```
Carefully choose whether to remove a parameter from only a single domain or globally. A clear tracker can be removed from all websites, but a UID may be required for some websites to operate. Generic UID names should not be removed globally.

Depending on the script enter the domain name and the parameter to remove. The script will do the rest.

## Remove element by class or id (legacy)

```zsh

./insert-filter-remove-element.sh
```

- Enter the domain
- Enter the identifier, following given instructions

Hit enter, and the rule will be added to the blocklist. Note that this won't be in the pihole blocklist and work for DNS only filters

## Add filter to remove a class from element (legacy)

```zsh
./insert-filter-remove-class.sh 
```

Do you want to remove a class from an element? For example a class making the body disappear to show a cookie banner?

- Enter the domain name, the class, and the element to remove it from

Hit enter, and the class removal rule will be added
Note that all rules are set to stay active, so that they will continue to work on page refreshes as well as with async content.

## Add filter to remove hidden overflow (legacy)

```zsh
./insert-filter-remove-overflow-hidden.sh
```

- Enter the domain name

Hit enter, and the hidden overflow will be removed from the body
