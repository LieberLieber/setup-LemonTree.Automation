#getLTA.ps1
param(
    [parameter(Mandatory = $true)]
    [string]$LemonTreePackageURL,

    [parameter(Mandatory = $false)]
    [string]$License
)

echo "Download LemonTree.Automtion from Repo"
while (Test-Path Alias:curl) {Remove-Item Alias:curl} #remove the alias binding from curl to Invoke-WebRequest
curl "$LemonTreePackageURL" --output LTA.zip -k
Expand-Archive LTA.zip -DestinationPath .\LTA\ -Force

IF([string]::IsNullOrWhiteSpace($License)) {            
    echo "No License info provided."         
} else {            
    echo "Create License File from provided info"
    $License | Out-File -FilePath lta.lic #if you deploy the license on the fly
}  
$version = .\LTA\LemonTree.Automation.exe Version
echo "$version"
echo '::set-output name=LemonTreeAutomationExecutable::.\LTA\LemonTree.Automation.exe'
