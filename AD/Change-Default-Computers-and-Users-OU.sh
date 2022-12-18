Get-ADDomain | select computerscont*
redircmp "OU=Computers,OU=Production,DC=DOMAIN,DC=LOCAL"
Get-ADDomain | select userscont*
redirusr "OU=Users,OU=Production,DC=DOMAIN,DC=LOCAL"
