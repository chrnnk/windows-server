Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline

Get-Mailbox -ResultSize Unlimited | Where {$_.RecipientTypeDetails -eq "SharedMailbox"} | Get-MailboxAutoReplyConfiguration | Where-Object {$_.AutoReplyState -EQ "Enabled"}