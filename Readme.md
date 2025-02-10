# Delete New Teams Cache

This repository contains a PowerShell script to clear the cache for the new Microsoft Teams client (V2). This script is useful for administrators who want to ensure a clean state for Teams by removing old cache files.

## How to Use the Script

### Requirements
- PowerShell

### Instructions

#### Run as a Logon Script
1. Copy the `EmptyTeamsCacheV2.ps1` script to the following folder:
   ```plaintext
   C:\Windows\System32\GroupPolicy\User\Scripts\Logon

2. The script will automatically run at user logon, clearing the Teams cache for the new Teams client.

#### Run Manually

1. Have Teams on the login screen (All users logged out).
2. Open PowerShell.
3. Paste the script and run it.

### What the Script Does

1. Stops Microsoft Teams if it is running.
2. Deletes the following cache folders:

       $env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe
       $env:LOCALAPPDATA\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy
       $env:LOCALAPPDATA\Microsoft\OneAuth
       $env:LOCALAPPDATA\Microsoft\TokenBroker
       $env:LOCALAPPDATA\Microsoft\IdentityCache
4. Restarts Microsoft Teams.

### License

This project is licensed under the GNU General Public License v3.0 - see the LICENSE file for details.

### Author
Joao Neisinger
