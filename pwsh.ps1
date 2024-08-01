#region Source only required profile component
Write-Host 'Inside pwsh.ps1' -ForegroundColor Green
$ProfileComponent = (
    'config',
    'appearance',
    'autocomplete',
    'background-job',
    'custom-function'
)

$ProfileComponent | ForEach-Object {
    $CompFile = [System.IO.Path]::Join($PSScriptRoot, "$_.ps1")
    try {
        . $CompFile
    } catch {
        Write-Warning "Error loading $CompFile component"
    }
}
Remove-Variable ProfileComponent
#endregion Source Component