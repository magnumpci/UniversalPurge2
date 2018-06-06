#cls

$MyProfile = $env:USERPROFILE
$TARGETDIR = "$MyProfile\Downloads\StardockSupportTemp"
$url = "http://sd.stardock.com/Support/Software/Multiplicity/Current/Multiplicity_3.exe"
$output = "$MyProfile\Downloads\StardockSupportTemp\Multiplicity_3.exe"

#Create temp directory
Write-Host '******************************************'
Write-Host "Creating Temp Directory if it does not exist..." -ForegroundColor black -BackgroundColor White
Write-Host '...'

if(!(Test-Path -Path $TARGETDIR )){
    New-Item -ItemType directory -Path $TARGETDIR
    Write-Host 'The following temp directory was created:' -ForegroundColor black -BackgroundColor White
    Write-Host $TARGETDIR 
    Write-Host '...'
}
else
{
Write-Host 'Directory already exists proceeding...' -ForegroundColor black -BackgroundColor White
Write-Host '...'
Write-Host "Script will now attempt to downlaod latest Multiplicity..." -ForegroundColor black -BackgroundColor White
Read-Host -Prompt "Press Enter to continue"
}

#Download
Invoke-WebRequest -Uri $url -OutFile $output
Read-Host -Prompt "Press Enter to continue"