# For the new Teams client (V2) 

# Stop Microsoft Teams if it is running
$TeamsProcess = Get-Process -Name ms-teams -ErrorAction SilentlyContinue
if ($TeamsProcess) {
    $TeamsProcPath = $TeamsProcess.Path
    $TeamsProcess | Stop-Process -Force
    Write-Output "Microsoft Teams stopped"
} else {
    $TeamsProcPath = $null
    Write-Output "Microsoft Teams is not running"
}

# Define the folders to delete
$folders = @(
    "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe",
    "$env:LOCALAPPDATA\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy",
    "$env:LOCALAPPDATA\Microsoft\OneAuth",
    "$env:LOCALAPPDATA\Microsoft\TokenBroker",
    "$env:LOCALAPPDATA\Microsoft\IdentityCache"
)

# Delete the specified folders
foreach ($folder in $folders) {
    if (Test-Path $folder) {
        Write-Output "Deleting folder: $folder"
        Remove-Item -Path $folder -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# Restart Microsoft Teams if it was running
if ($TeamsProcPath) {
    Start-Process -FilePath $TeamsProcPath
    Write-Output "Microsoft Teams restarted"
} else {
    Write-Output "Microsoft Teams was not running, skipping restart"
}