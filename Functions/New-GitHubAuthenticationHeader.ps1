function New-GitHubAuthenticationHeader {
    <#
        .SYNOPSIS
            Creates the Authentication Header needed to use the GitHub API
        .DESCRIPTION
            Requires a pre-configured API Token from GitHub, and uses it to create the Header needed for API Queries
        .PARAMETER GitHubToken
            Token generated on GitHub and specified as USERNAME:Token
        .EXAMPLE
            New-GitHubAuthenticationHeader -GitHubToken USERNAME:ghp_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]$GitHubToken
    ) 
    BEGIN { 

    } #BEGIN

    PROCESS {
        $base64Token = [System.Convert]::ToBase64String([char[]]$GitHubToken)
        $GitHubAuthenticationHeader = @{
            Authorization = 'Basic {0}' -f $base64Token
        };
    } #PROCESS

    END { 
        $GitHubAuthenticationHeader
    } #END

} #FUNCTION