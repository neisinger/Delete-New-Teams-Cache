# For the new Teams client (V2) 

# Stop Microsoft Teams if it is running
$TeamsProcPath = (Get-Process ms-teams).Path
Get-Process ms-teams | Stop-Process

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


# Restart Microsoft Teams
Start-Process -FilePath $TeamsProcPath