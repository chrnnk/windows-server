Get-ADUser -SearchBase "DC=trinity,DC=local" -Filter * -Properties nTSecurityDescriptor | ?{ $_.nTSecurityDescriptor.AreAccessRulesProtected -eq "True" } | ft SamAccountName,Name -AutoSize
