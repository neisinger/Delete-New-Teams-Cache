# Delete New Teams Cache

This repository contains a PowerShell script to clear the cache for the new Microsoft Teams client (V2). This script is useful for administrators and users who want to resolve common Teams issues such as login problems, sync errors, or performance degradation by removing old cache files and authentication data.

## How to Use the Script

### Requirements
- PowerShell (Windows)
- Administrative privileges may be required depending on the execution policy
- New Microsoft Teams client (V2) installed

### Instructions

#### Run as a Logon Script
1. Copy the `EmptyTeamsCacheV2.ps1` script to the following folder:
   ```plaintext
   C:\Windows\System32\GroupPolicy\User\Scripts\Logon
   ```
2. The script will automatically run at user logon, clearing the Teams cache for the new Teams client.

#### Run Manually

1. Ensure all users are logged out of Teams (Teams should be on the login screen).
2. Open PowerShell with appropriate permissions.
3. Navigate to the script directory or copy the script content.
4. Execute the script:
   ```powershell
   .\EmptyTeamsCacheV2.ps1
   ```
   Or paste the script content directly into PowerShell and press Enter.

### What the Script Does

1. Stops Microsoft Teams if it is running.
2. Deletes the following cache and authentication folders:
   - `$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe` (Teams app data)
   - `$env:LOCALAPPDATA\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy` (Azure AD Broker Plugin)
   - `$env:LOCALAPPDATA\Microsoft\OneAuth` (OneAuth cache)
   - `$env:LOCALAPPDATA\Microsoft\TokenBroker` (Token Broker cache)
   - `$env:LOCALAPPDATA\Microsoft\IdentityCache` (Identity cache)
3. Restarts Microsoft Teams if it was running before the script executed.

### Important Notes

- **Data Safety**: This script only removes cache and temporary authentication data. Your Teams messages, files, and settings stored in the cloud are not affected.
- **Re-authentication**: After running the script, you may need to sign in to Teams again.
- **Execution Policy**: If you encounter an execution policy error, you may need to run PowerShell as Administrator and set the execution policy: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`
- **Backup**: While this script only removes cache files, it's always good practice to ensure your important data is backed up.

## License

This project is licensed under the GNU General Public License v3.0 - see the LICENSE file for details.

## Author

Joao Neisinger
