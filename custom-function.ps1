function Copy-Content {
    <#
    .SYNOPSIS
    Copies content of given file to clipboard
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'Path to the file to copy')]
        [ValidateScript({ Test-Path $_ -PathType Leaf })]
        [string]$FilePath
    )
    try {
        Get-Content -Path $FilePath -Raw | Set-Clipboard
    } catch {
        Write-Error "Unable to copy content from '$FilePath' : $_"
    }
}
function Get-CommandDetail {
    <#
    .SYNOPSIS
        Gets details about a command. For external commands (executables), it shows the path.
        For PowerShell functions and cmdlets, it displays the definition.
    #>
    [Alias('which')]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'The name of the command')]
        [string]$Name
    )
    try {
        $CommandInfo = Get-Command -Name $Name -ErrorAction Stop
        $CommandInfo | Select-Object -ExpandProperty Definition
    } catch {
        Write-Error "Command '$Name' not found"
    }
}