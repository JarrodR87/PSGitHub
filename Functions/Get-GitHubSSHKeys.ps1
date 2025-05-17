function Get-GitHubSSHKeys {
    <#
        .SYNOPSIS
            Retrieves the current public SSH keys used by GitHub.

        .DESCRIPTION
            This function queries the GitHub Meta API to retrieve the list of SSH public keys 
            currently used by GitHub for securing SSH connections.

        .PARAMETER None
            This function takes no parameters.

        .EXAMPLE
            Get-GitHubSSHKeys
            Returns an array of GitHub's current SSH public keys.
    #>
    [CmdletBinding()]
    Param()

    BEGIN {
        $apiUrl = "https://api.github.com/meta"
    }

    PROCESS {
        try {
            $response = Invoke-RestMethod -Uri $apiUrl -UseBasicParsing
            $sshKeys = $response.ssh_keys
        } catch {
            throw "Failed to retrieve GitHub SSH keys: $_"
        }
    }

    END {
        return $sshKeys
    }
}
