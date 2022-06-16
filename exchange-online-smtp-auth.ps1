Install-Module -Name ExchangeOnlineManagement
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline
Get-CASMailbox -Identity upn@domain.com  | Format-List SmtpClientAuthenticationDisabled
Set-CASMailbox -Identity upn@domain.com -SmtpClientAuthenticationDisabled $false
Get-CASMailbox -Identity upn@domain.com  | Format-List SmtpClientAuthenticationDisabled
