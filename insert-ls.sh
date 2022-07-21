read domain;
sed -i "s/\"denied-remote-domains\": \"\",$/\"denied-remote-domains\": \"${domain}\",/g" little-snitch-blocklist.lsrules
