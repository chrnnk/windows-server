From a Domain Controller, download LAPS installer and run the file as Administrator and install all components.

https://www.microsoft.com/en-us/download/details.aspx?id=46899

Reboot the DC.

Extend the Active Directory schema by opening PowerShell as an Administrator, while logged in as a member of Schema Admins. Then run the below two PowerShell commands:
```
Import-Module AdmPwd.PS
Update-AdmPwdADSchema
```
After the schema has been updated, your Active Directory computer objects should have two new attributes. ms-Mcs-AdmPwd and ms-Mcs-AdmPwdExpirationTime.

We need to give the computer units permission to be able to update these two new attributes. This is done by running the below command:
```
Set-AdmPwdComputerSelfPermission -OrgUnit "OU=Servers,OU=OUNAME,DC=DCNAME,DC=local"
Set-AdmPwdComputerSelfPermission -OrgUnit "OU=Computers,OU=OUNAME,DC=DCNAME,DC=local"
Set-AdmPwdComputerSelfPermission -OrgUnit "OU=Test,OU=Computers,OU=OUNAME,DC=DCNAME,DC=local"
Set-AdmPwdComputerSelfPermission -OrgUnit "OU=Virtual Machines,OU=Computers,OU=OUNAME,DC=DCNAME,DC=local"
```
We now need to give certain users the ability to access these new administrator passwords that will be stored in AD. To do this, create a new security group called "LAPS Admins" and then run the below command to give the new security group the permissions. Any users in this new security group will be able to view the computer administrator passwords.
```
Set-AdmPwdReadPasswordPermission -Identity Workstations -AllowedPrincipals "LAPSAdmins"
```
Now we need to use group policy to deploy the LAPS application to all computers, and copy the LAPS application to a file share which all computers can access.

Using file explorer, navigate to \\LOCALDOMAINNAME\SYSVOL\LOCALDOMAINNAME\scripts and create a new folder called LAPS

Copy the LAPS application into the newly created LAPS folder.

Open the Group Policy Management Console.

Create a new Group policy object called LAPS

Open the new LAPS group policy object and navigate to Computer Configuration > Policies > Software Settings > Software installation

Right click in the software installation and create a new install.

Select the installer file from \\LOCALDOMAINNAME\SYSVOL\LOCALDOMAINNAME\scripts\laps and press okay.

Under Computer Configuration > Policies > Administrative Template > LAPS, configure the 4 LAPS settings.

Enable local admin password management
Password Settings
Do not allow password expiration time longer than required
Name of administrator account to manage (This setting is not required to be configured unless you have renamed the default administrator account name)
Close the Group Policy Management Editor.

Link the new LAPS group policy object to your Workstations OU.

Laps has now been deployed.

To test to make sure that LAPS is working, run the following command on one of the workstations.

gpupdate /force
Once group policy has been updated, restart the computer and the LAPS software should be automatically installed during the reboot phase.

After the reboot, log back into the workstation and run the below command again. This should force the local administrator password to be updated and written to Active Directory.

gpupdate /force
When the computer has finished rebooting, the updated local administrator password should have been written to the active directory computer object.
