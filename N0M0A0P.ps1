[CmdletBinding()]
Param(
    $DownloadURL = " https://nmap.org/dist/nmap-7.93-setup.exe",
    $DownloadLocation = "$env:APPDATA/Nmap",
    $InstallLocation = "C:\aaa",
    $LogLocation = "$DownloadLocation/install.log"
)

If(! (Test-Path $DownloadLocation) ){
    New-Item -Path $DownloadLocation -ItemType Directory
}

If(! (Test-Path $InstallLocation) ){
    New-Item -Path $InstallLocation -ItemType Directory
}

$Installer = "$DownloadLocation/nmap-7.93-setup.exe"

Invoke-WebRequest -UseBasicParsing -Uri $DownloadURL -OutFile $Installer

& $Installer /q /log $LogLocation INSTALLLOCATION="$InstallLocation"
