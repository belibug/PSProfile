#region Environment Variable
@{
    EDITOR = 'nvim'
    VISUAL = 'nvim'
    # Add more
}.GetEnumerator() | ForEach-Object {
    [System.Environment]::SetEnvironmentVariable($_.Key, $_.Value)
}
#endregion environment variables


#region PSReadline Options
$PSReadLineOptions = @{
    PredictionSource              = 'HistoryAndPlugin'
    PredictionViewStyle           = 'Inline'
    EditMode                      = 'Vi'
    HistoryNoDuplicates           = $true
    HistorySearchCursorMovesToEnd = $true
    BellStyle                     = 'Visual'
}
Set-PSReadLineOption @PSReadLineOptions

## Toggle prediction view between inline and listview
Set-PSReadLineKeyHandler -Chord F2 -Function SwitchPredictionView

# History mapping for arrow keys
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Shell navigation
Set-PSReadLineKeyHandler -Key Alt+d -Function ShellKillWord
Set-PSReadLineKeyHandler -Key Alt+Backspace -Function ShellBackwardKillWord
Set-PSReadLineKeyHandler -Key Alt+b -Function ShellBackwardWord
Set-PSReadLineKeyHandler -Key Alt+f -Function ShellForwardWord
Set-PSReadLineKeyHandler -Key Alt+B -Function SelectShellBackwardWord
Set-PSReadLineKeyHandler -Key Alt+F -Function SelectShellForwardWord

#endregion PSReadline