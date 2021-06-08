
function Get-AuthHeader  {
    param (
        [System.Management.Automation.PSCredential]$Credentials
    )
    Invoke-RestMethod -Uri ("https://api.github.com/user") -Credential $C
    $auth = [System.Convert]::ToBase64String([char[]]$Creds.GetNetworkCredential().Password)
    $headers = @{Authorization="Basic $auth"}
    Invoke-RestMethod -Headers $headers https://api.github.com
    <#
    .Synopsis 
    Dit is een functie die er voor zorgt dat u automatisch kan aanloggen op github.
    -Credentials: een password/username in PSCredentials 
    .Example Get-AuthHeader -Credentials $C
    #>
}

function Add-githubCollaborator {
    param (
        [System.Management.Automation.PSCredential]$Credentials,
        [string]$Collaborator,
        [string]$Repository
    )
    Get-AuthHeader($Credentials)
    Get-GitHubRepository($Repository)
    <#
    .Synopsis 
    Dit is een functie die er voor zorgt dat u automatisch een collaborator kan toevoegen op github.
    -Credentials: een password/username in PSCredentials 
    -Collaborator: de persoon die u wilt toevoegen als collaborator
    -Repository: De repository aan wat u de Collaborator wilt toevoegen.
    .Example Get-AuthHeader -Credentials $C -Collaborator Bram-cell -Repository Test
    #>
}
}