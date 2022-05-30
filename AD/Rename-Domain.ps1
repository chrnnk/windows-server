# turn off windows firewall
# create new zone with new domain names in DNS. also create matching _msdcs zone
rendom /list
# edit Domainlist.xml with new domain name
rendom /upload
rendom /prepare
repadmin /syncall DC1 /d /e /P /a
rendom /execute
# Rename Domain Controllers
netdom computername
gpfixup /olddns:XXXXX.local /newdns:YYYYY.local
gpfixup /oldnb:XXXXX /newnb:YYYYYY
rendom /clean
