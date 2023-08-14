# Set variables for the script to run
$filename = "c:\custom.list"
$domain = 'mydomain.local'

# Run the DNS command to export entries to a file
Get-DnsServerResourceRecord -ZoneName $domain | select-object @{n='IP';E={$_.recorddata.IPV4Address}}, {$_.hostname+".cloud.local"} | ft -HideTableHeaders | Out-File $filename

# Trim blank lines from the resulting file
(gc $filename) | ? {$_.trim() -ne "" } | set-content $filename
