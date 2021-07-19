function Invoke-GitHubRepoClone {
    <#
        .SYNOPSIS
            Clones all Repos for the User who generated the Token
        .DESCRIPTION
            Queries all GitHub Repos for the specified Token bearer and then Clones them all using Git
        .PARAMETER GitHubToken
            Token generated on GitHub and specified as USERNAME:Token
        .PARAMETER LocalPath
            Local Path to save Cloned Repos
        .EXAMPLE
            C
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]$GitHubToken,
        [Parameter(Mandatory = $true)]$LocalPath
    ) 
    BEGIN { 

        $LocalPath = $LocalPath.Trimend('\')
        $LocalPath = $LocalPath + '\'

        $GitHubRepos = Invoke-GitHubRepoQuery -GitHubToken $GitHubToken | Select-Object name, clone_url, ssh_url, owner


    } #BEGIN

    PROCESS {
        foreach ($GitHubRepo in $GitHubRepos) {
            $RepoName = $GitHubRepo.name
            git clone $GitHubRepo.ssh_url ($LocalPath + $RepoName)
        }
    } #PROCESS

    END { 

    } #END

} #FUNCTION