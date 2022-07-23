declare blocklist="./blocklist.txt"
declare unboundBlocklist="./unbound-blocklist.txt"
declare rpzBlocklist="./rpz-blocklist.txt"

declare version=$(date +"%Y%m%d")

declare blocklistVersionTag="! Version: "
declare blocklistVersionLine="! Version: $version"
sed -i '' "s/blocklistVersionTag.*/blocklistVersionLine/g" $blocklist

declare unboundVersionTag="# Version: "
declare unboundVersionLine="# Version: $version"
sed -i '' "s/unboundVersionTag.*/unboundVersionLine/g" unboundBlocklist

declare rpzVersionTag="; Version: "
declare rpzVersionLine="; Version: $version"
sed -i '' "s/rpzVersionTag.*/rpzVersionLine/g" rpzBlocklist
