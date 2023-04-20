Get-MsolUser -all | Where-Object {$_.BlockCredential -eq $false} | Select-Object DisplayName,@{N="MFA User Setup"; E={ if( $_.StrongAuthenticationMethods -ne $null){"Enabled"} else { "Disabled"}}}

Get-MsolUser -all | Where-Object {$_.BlockCredential -eq $false} | Select-Object DisplayName,UserPrincipalName,@{N="MFA User Setup"; E={ if( $_.StrongAuthenticationMethods -ne $null){"Enabled"} else { "Disabled"}}}

Get-MsolUser -all | Where-Object {$_.BlockCredential -eq $false} | Select-Object DisplayName,UserPrincipalName,@{N="MFA User Setup"; E={ if( $_.StrongAuthenticationMethods -ne $null){"Enabled"} else { "Disabled"}}},@{N="MFA Admin Enforced"; E={ if( $_.StrongAuthenticationRequirements.State -ne $null){ $_.StrongAuthenticationRequirements.State} else { "Disabled"}}}

@{N="Is Licensed"; E={ if( $_.Licenses.AccountSku.SkuPartNumber -ne $null){"Licensed"} else { "Unlicensed"}}}

Get-MsolUser -all | Where-Object {$_.BlockCredential -eq $false} | Select-Object DisplayName,UserPrincipalName,@{N="MFA User Setup"; E={ if( $_.StrongAuthenticationMethods -ne $null){"Enabled"} else { "Disabled"}}},@{N="Is Licensed"; E={ if( $_.Licenses.AccountSku.SkuPartNumber -ne $null){"Licensed"} else { "Unlicensed"}}} | Export-CSV -NoTypeInformation -Encoding UTF8 c:\temp\MFAUsers.csv


Get-MsolUser | Select-Object UserPrincipalName, DisplayName, licenses, islicensed |
Where-Object {
$Skus = $_.Licenses.AccountSku.SkuPartNumber;
if ($Skus -notcontains "ATP_ENTERPRISE" -and ($Skus -contains "O365_BUSINESS_ESSENTIALS" -or $Skus -contains "O365_BUSINESS_PREMIUM")) { $true };
}