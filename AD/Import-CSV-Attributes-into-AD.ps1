# If you output the CSV from 365, you will need to change the separators in the proxy addresses column from + to , before import
# Below is the sample header from a 365 export on 2/8/2023
# SamAccountName,Name,Office,PhoneNumber,proxyAddresses,UserPrincipalName
$USERS = Import-CSV C:\Temp\UserList.csv
$USERS | ForEach-Object {

    $office=$_.Office
    # Line below sets blank Office locations to a space
    if($_.Office.Length -lt 1)
       {$office = " "}
    $phonenumber=$_.PhoneNumber
    # Line below sets blank phone numbers to a space
    if($_.PhoneNumber.Length -lt 1)
       {$phonenumber = " "}
    # Line below will import multiple proxy addresses correctly, but the CSV output from 365 separates the proxy addresses with a + that needs to be changed to a , before import
    $proxyaddresses=$_.proxyAddresses -split ','
    $upn=$_.UserPrincipalName

    Set-ADUSer -Identity $_.SamAccountName -replace @{telephoneNumber=$phonenumber;  physicalDeliveryOfficeName=$office; proxyAddresses=$proxyaddresses; UserPrincipalName=$upn}
}
