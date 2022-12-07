Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline

# Next command shows each mailbox in a block of info
Get-Mailbox -Filter {recipienttypedetails -eq "SharedMailbox"}
# Next commands shows a grid
Get-Mailbox -ResultSize Unlimited | Where {$_.RecipientTypeDetails -eq "SharedMailbox"} | Select DisplayName,PrimarysmtpAddress,GrantSendOnBehalfTo