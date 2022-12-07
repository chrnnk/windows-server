Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline

Get-Mailbox -ResultSize Unlimited | Get-MailboxAutoReplyConfiguration | Where-Object {$_.AutoReplyState -EQ "Enabled" -and $_.RecipientTypeDetails -eq "SharedMailbox"} | Select-Object -Property Identity,AutoreplyState,StartTime,EndTime