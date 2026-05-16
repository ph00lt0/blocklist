# No need for history of commits :)

if [[ -n $(git status --porcelain) ]]; then
    git config set --local user.name "blocklist" 
    git config set --local user.email "-"
    git checkout --orphan temp
    git add -A
    git commit -am "release blocklist"
    git branch -D master
    git branch -m master
    git push -f origin master
    git push -f github master
else
    echo "There are no changes in the repository"
fi
