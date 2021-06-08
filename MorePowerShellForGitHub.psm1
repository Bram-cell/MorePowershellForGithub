function Get-AuthHeader  {
    param (
        [System.Management.Automation.PSCredential]$Credentials
    )
    Invoke-RestMethod -Uri ("https://api.github.com/user") -Credential $C
    $auth = [System.Convert]::ToBase64String([char[]]$Creds.GetNetworkCredential().Password)
    $headers = @{Authorization="Basic $auth"}
    Invoke-RestMethod -Headers $headers https://api.github.com
}
