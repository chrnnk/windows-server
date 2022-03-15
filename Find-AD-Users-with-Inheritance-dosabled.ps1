Get-ADUser -SearchBase "DC=butts,DC=local" -Filter * -Properties nTSecurityDescriptor | ?{ $_.nTSecurityDescriptor.AreAccessRulesProtected -eq "True" } | ft SamAccountName,Name -AutoSize
