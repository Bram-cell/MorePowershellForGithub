function Get-AuthHeader  {
    param (
        [String]$C
    )
    $auth = [System.Convert]::ToBase64String([char[]]$C);
    $headers = @{Authorization = "Basic $auth"}
  
   return $headers

}

function Add-githubCollaborator {
    param (
        [System.Management.Automation.PSCredential]$Credentials,
        [string]$Collaborator,
        [string]$Repository
    )
    Get-AuthHeader($Credentials)
    Get-GitHubRepository($Repository)

}


