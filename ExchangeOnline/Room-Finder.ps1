Get-EXOMailbox -RecipientTypeDetails RoomMailbox | Sort DisplayName | Get-Place | ft DisplayName,City,Building,Floor - Autosize

Add-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "650CR - Win-Win"

Get-DistributionGroupMember -Identity "CLT Conference Rooms"

Set-Place "winwin@domain.com" -CountryOrRegion "US" -State "North Carolina" -City "Charlotte" -Building "650 South Tryon" -Floor 9 -Capacity 20
Set-Place -Identity "650CR - Bull" -CountryOrRegion "US" -State "North Carolina" -City "Charlotte" -Building "650 South Tryon" -Floor 9 -Capacity 20

Get-DistributionGroupMember -Identity "CLT Conference Rooms"

Add-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "440 Amenities Center"
Add-DistributionGroupMember -Identity "CLT Conference Rooms" -Member "440 Fitness Center"

Set-Place -Identity "440 Amenities Center" -CountryOrRegion "US" -State "North Carolina" -City "Charlotte" -Building "440 South Church" -Floor 2 -Capacity 20