Get-DistributionGroup -RecipientTypeDetails RoomList

New-DistributionGroup -Name "650 South Tryon" -RoomList
New-DistributionGroup -Name "440 South Church" -RoomList
New-DistributionGroup -Name "200 South College" -RoomList

Get-EXOMailbox -RecipientTypeDetails RoomMailbox | Sort DisplayName | Get-Place | ft DisplayName,City,Building,Floor - Autosize

Add-DistributionGroupMember -Identity "650 South Tryon" -Member "650CR - Win-Win"

Add-DistributionGroupMember -Identity "440 South Church" -Member "440 Amenities Center"
Add-DistributionGroupMember -Identity "440 South Church" -Member "440 Fitness Center"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "440 Amenities Center"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "440 Fitness Center"
Get-DistributionGroup -RecipientTypeDetails RoomList
Get-DistributionGroupMember -Identity "CLT Conference Rooms"
Remove-DistributionGroup -Identity "CLT Conference Rooms"

Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - Risk"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - Reward"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - People Ops"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - Wellness"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - Win-Win"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - Touch Base"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - Deep Dive"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - The Pitch Room"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - Bull"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - Eastgate"
Remove-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - Park Point"

Get-DistributionGroupMember -Identity "CLT Conference Rooms"

Set-Place "winwin@domain.com" -CountryOrRegion "US" -State "North Carolina" -City "Charlotte" -Building "650 South Tryon" -Floor 9 -Capacity 20
Set-Place -Identity "650CR - Bull" -CountryOrRegion "US" -State "North Carolina" -City "Charlotte" -Building "650 South Tryon" -Floor 9 -Capacity 20

Get-DistributionGroupMember -Identity "CLT Conference Rooms"

Add-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "440 Amenities Center"
Add-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "440 Fitness Center"

Set-Place -Identity "440 Amenities Center" -CountryOrRegion "US" -State "North Carolina" -City "Charlotte" -Building "440 South Church" -Floor 2 -Capacity 20

Get-MailBox | where {$_.ResourceType -eq "Room"} | Get-MailboxCalendarConfiguration

Set-MailboxCalendarConfiguration -Identity "650CR - Risk"-WorkingHoursTimeZone "Eastern Standard Time"
Set-MailboxCalendarConfiguration -Identity "650CR - Reward" -WorkingHoursTimeZone "Eastern Standard Time"
Set-MailboxCalendarConfiguration -Identity "650CR - People Ops" -WorkingHoursTimeZone "Eastern Standard Time"
Set-MailboxCalendarConfiguration -Identity "650CR - Wellness" -WorkingHoursTimeZone "Eastern Standard Time"
Set-MailboxCalendarConfiguration -Identity "650CR - Win-Win" -WorkingHoursTimeZone "Eastern Standard Time"
Set-MailboxCalendarConfiguration -Identity "650CR - Touch Base" -WorkingHoursTimeZone "Eastern Standard Time"
Set-MailboxCalendarConfiguration -Identity "650CR - Deep Dive" -WorkingHoursTimeZone "Eastern Standard Time"
Set-MailboxCalendarConfiguration -Identity "650CR - The Pitch Room" -WorkingHoursTimeZone "Eastern Standard Time"
Set-MailboxCalendarConfiguration -Identity "650CR - Bull" -WorkingHoursTimeZone "Eastern Standard Time"
Set-MailboxCalendarConfiguration -Identity "650CR - Eastgate" -WorkingHoursTimeZone "Eastern Standard Time"
Set-MailboxCalendarConfiguration -Identity "650CR - Park Point" -WorkingHoursTimeZone "Eastern Standard Time"