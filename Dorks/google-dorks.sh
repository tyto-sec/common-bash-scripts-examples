#!/bin/bash
SEARCH="firefox"
TARGET="$1"

echo "Pastebin Search"
$SEARCH "https://google.com/search?q=site:pastebin.com+$TARGET" 2> /dev/null
echo "Github Search"
$SEARCH "https://google.com/search?q=site:github.com+$TARGET" 2> /dev/null
echo "File Search"
$SEARCH "https://google.com/search?q=site:$TARGET+ext:php+OR+ext:asp+OR+ext:txt+OR+ext:pdf+OR+ext:doc+OR+ext:docx+OR+ext:xls+OR+ext:xlsx+OR+ext:ppt+OR+ext:pptx+OR+ext:ovpn+OR+ext:sql+OR+ext:bak+OR+ext:log+OR+ext:xml+OR+ext:conf+OR+ext:cfg+OR+ext:ini+OR+ext:sh+OR+ext:env+OR+ext:yaml+OR+ext:json+OR+ext:dat+OR+ext:csr+OR+ext:key+OR+ext:pem+OR+ext:cer+OR+ext:id_rsa+OR+ext:id_dsa+OR+ext:pub+OR+ext:ppk+OR+ext:crt+OR+ext:der" 2> /dev/null
echo "Index Page Search"
$SEARCH "https://google.com/search?q=site:$TARGET+intitle:'index of /'+OR+'Index of'" 2> /dev/null
echo "Domains Search"
$SEARCH "https://google.com/search?q=site:$TARGET+-www" 2> /dev/null