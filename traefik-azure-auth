# config for azure app to forward traefic auth to
# login to azure
az login

# variables
$replyUrls = "https://traefik.YOURDOMAIN.com/_oauth",  "https://traefikauth.YOURDOMAIN.com/_oauth"
$applicationName = "TraefikDashboardAuthentication"

# create application
$applicationRaw = az ad app create --display-name $applicationName --reply-urls $replyUrls
$application = $applicationRaw | ConvertFrom-Json
Write-Output "Successfully created Azure AD application";

# create application secret
$credentialsRaw = az ad app credential reset --id $application.appId --credential-description "traefikSecret"
$credentials = $credentialsRaw  | ConvertFrom-Json
Write-Output "Successfully created Azure AD application secret";


# add api permissions (Azure Active Directory -> User.Read permission)
$api = "00000002-0000-0000-c000-000000000000";
$apiPermissions = "311a71cc-e848-46a1-bdf8-97ff7156d8e6=Scope"
az ad app permission add --id $application.appId --api $api --api-permissions $apiPermissions

# grant api permissions (Azure Active Directory -> User.Read permission)
az ad app permission admin-consent --id $application.appId


Write-Output " -----------------------------"
Write-Output "Application Id: $($application.appId)"
Write-Output "Application Secret: $($credentials.password)"
Write-Output " -----------------------------"
