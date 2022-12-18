Active Directory: How to Prevent Authenticated Users from Joining Workstations to a Domain


Administrator can control it with two ways

1. By Modifying ms-DS-MachineAccountQuota attribute

Open Active Directory Services Interface Console (ADSI Edit) ( Start > Run > adsiedit.msc)

Right click on ADSI Edit and click on Connect to... 

Select "Default naming context" from the well known naming context dropdown menu

Right click Domain Name and click on Properties

On the Attribute Editor Tab scroll down to  ms-DS-MachineAccountQuota 

Click Edit ms-DS-MachineAccountQuota and set to 0, Click OK to exit.

Note:
That users in the Administrators or Domain Administrators groups, and those users who have delegated permissions on containers in Active Directory to create and delete computer accounts, are not restricted by this limitation.

2. By Default Domain Controllers Policy

Open Group Policy Management Console ( Start > Run > gpmc.msc).

Locate Domain Controllers OU and find Default Domain Controllers Policy.

Edit Default Domain Controllers Policy.

Expand Computer Configuration – Policies – Windows Settings – Security Settings – User Rights Assignment

From right pane right click on Add workstations to domain – Properties – Remove Authenticated Users and Add the User or Group that you are delegating domain joining permissions.

Click Apply and then OK to close the Properties window. 
