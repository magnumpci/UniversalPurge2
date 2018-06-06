# Self-elevate the script if required
<# if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
        Exit
    }
} #>

#cls
#Set-ExecutionPolicy Bypass -Confirm

#Get user info and set temp download directory
$MyProfile = $env:USERPROFILE
$TARGETDIR = "$MyProfile\Downloads\StardockSupportTemp"


#Multiplicity

#Purge






$url = "http://sd.stardock.com/Support/Software/Multiplicity/Current/Multiplicity_3.exe"
$output = "$MyProfile\Downloads\StardockSupportTemp\Multiplicity_3.exe"

#Create temp directory
Write-Host '******************************************'
Write-Host "Creating Temp Directory if it does not exist..." -ForegroundColor black -BackgroundColor White
Write-Host '...'

if (!(Test-Path -Path $TARGETDIR )) {
    New-Item -ItemType directory -Path $TARGETDIR
    Write-Host 'The following temp directory was created:' -ForegroundColor black -BackgroundColor White
    Write-Host $TARGETDIR 
    Write-Host '...'
}
else {
    Write-Host 'Directory already exists proceeding...' -ForegroundColor black -BackgroundColor White
    Write-Host '...'
}

#Download
Write-Host "Script will now attempt to downlaod latest Multiplicity..." -ForegroundColor black -BackgroundColor White
Read-Host -Prompt "Press Enter to continue"
Invoke-WebRequest -Uri $url -OutFile $output
Read-Host -Prompt "Press Enter to continue"
.\test.ps1