Get-ADGroupMember -Identity Administrators | Select-Object name, objectClass,distinguishedName | Export-CSV -Path “adgroupmembers.csv”