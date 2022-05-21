Install-Module AzureAD
Connect-AzureAD
Get-AzureADUser -ObjectId user@domain.com | Select-Object UserprincipalName,@{N="PasswordNeverExpires";E={$_.PasswordPolicies -contains "DisablePasswordExpiration"}}
Set-AzureADUser -ObjectId user@domain.com -PasswordPolicies DisablePasswordExpiration
Get-AzureADUser -ObjectId user@domain.com | Select-Object UserprincipalName,@{N="PasswordNeverExpires";E={$_.PasswordPolicies -contains "DisablePasswordExpiration"}}