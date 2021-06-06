Read-Host -AsSecureString -Prompt 'token' |
ConvertFrom-SecureString |
Tee-Object .\secret.txt |
ConvertTo-SecureString |
Set-Variable ss_token
$creds = New-Object pscredential 'user', $ss_token
Set-GitHubAuthentication -SessionOnly `
-Credential $creds
get-content C:\Windows\system32\secret.txt | ConvertTo-SecureString | Set-Variable ss_token

$creds = New-Object pscredential 'user', $ss_token

Set-GitHubAuthentication -SessionOnly -Credential $creds

get-githubuser -current
• Set-GitHubProfile -Company 'AP Hogeschool'
• $repo = New-GitHubRepository `
-RepositoryName MorePowershellForGithub