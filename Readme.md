The script has to be copied to this folder to delete Teams Cache of the New Teams: 

C:\Windows\System32\GroupPolicy\User\Scripts\Logon

The script deletes these folders:

    "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe",
    "$env:LOCALAPPDATA\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy",
    "$env:LOCALAPPDATA\Microsoft\OneAuth",
    "$env:LOCALAPPDATA\Microsoft\TokenBroker",
    "$env:LOCALAPPDATA\Microsoft\IdentityCache"