function Invoke-GitHubRepoQuery {
    <#
        .SYNOPSIS
            Lists all Repositories for the Token Bearer
        .DESCRIPTION
            Queries the User Repos API to list all Repositories for the User who generated the API Token
        .PARAMETER GitHubToken
            Token generated on GitHub and specified as USERNAME:Token
        .EXAMPLE
            Invoke-GitHubRepoQuery -GitHubToken USERNAME:ghp_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        .EXAMPLE
            Invoke-GitHubRepoQuery -GitHubToken USERNAME:ghp_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX | Select-Object name,clone_url,ssh_url,owner
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]$GitHubToken
    ) 
    BEGIN { 
        $GitHubAuthenticationHeader = New-GitHubAuthenticationHeader -GitHubToken $GitHubToken
    } #BEGIN

    PROCESS {
        $Response = Invoke-RestMethod -Headers $GitHubAuthenticationHeader -Uri https://api.github.com/user/repos
    } #PROCESS

    END { 
        $Response
    } #END

} #FUNCTION