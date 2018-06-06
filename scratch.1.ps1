$MyProfile = $env:USERPROFILE
$TARGETDIR = "$MyProfile\Downloads\StardockSupportTemp"


Write-Host "Creating Temp Directory if it does not exist..." -ForegroundColor black -BackgroundColor White

if(!(Test-Path -Path $TARGETDIR )){
    New-Item -ItemType directory -Path $TARGETDIR
    Write-host 'The following temp directory was created:' -ForegroundColor black -BackgroundColor White
    Write-Host $TARGETDIR 
}
else
{
Write-host 'Path already exists, proceeding....' -ForegroundColor black -BackgroundColor White
}
Read-Host -Prompt "Press Enter to continue"