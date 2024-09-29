if [ -z "$1" ]; then
    echo "Google Dorks"
    echo "Example: $0 www.domain.com"

#!/bin/bash
SEARCH="firefox"
TARGET="$1"

echo "Pastebin Search"
$SEARCH "https://google.com/search?q=site:pastebin.com+$TARGET" 2> /dev/null
echo "Github Search"
$SEARCH "https://google.com/search?q=site:github.com+$TARGET" 2> /dev/null
echo "File Search"
$SEARCH "https://google.com/search?q=site:$TARGET+ext:php+OR+ext:asp+OR+ext:txt+OR+ext:pdf+OR+ext:doc+OR+ext:xls+OR+ext:xlsx+OR+ext:ovpn+OR+ext:sql+OR+ext:bak+OR+ext:log" 2> /dev/null
echo "Index Page Search"
$SEARCH "https://google.com/search?q=site:$TARGET+intitle:'index of /'+OR+'Index of'" 2> /dev/null
echo "Domains Search"
$SEARCH "https://google.com/search?q=site:$TARGET+-www" 2> /dev/null