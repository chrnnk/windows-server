## Build the message parameters
$mailParams = @{
    SmtpServer                 = 'smtp.server.here'
    Port                       = 25
    #UseSSL = $true   
    From                       = 'sender@yourdomain.com'
    To                         = 'recipient@yourdomain.com', 'recipient@NotYourDomain.com'
    Subject                    = ('ON-PREM SMTP Relay - ' + (Get-Date -Format g))
    Body                       = 'This is a test email using ON-PREM SMTP Relay'
    DeliveryNotificationOption = 'OnFailure', 'OnSuccess'
}
<# Send the message #>
Send-MailMessage @mailParams
