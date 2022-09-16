[CmdletBinding()]
Param(
    $DownloadURL = "https://windows.metasploit.com/metasploitframework-latest.msi",
    $DownloadLocation = "$env:APPDATA/Metasploit",
    $InstallLocation = "C:\Tools",
    $LogLocation = "$DownloadLocation/install.log"
)

If(! (Test-Path $DownloadLocation) ){
    New-Item -Path $DownloadLocation -ItemType Directory
}

If(! (Test-Path $InstallLocation) ){
    New-Item -Path $InstallLocation -ItemType Directory
}

$Installer = "$DownloadLocation/metasploit.msi"

Invoke-WebRequest -UseBasicParsing -Uri $DownloadURL -OutFile $Installer

& $Installer /q /log $LogLocation INSTALLLOCATION="$InstallLocation"
