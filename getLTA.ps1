#getLTA.ps1
param(
    [parameter(Mandatory = $false)]
    [string]$License,
    [parameter(Mandatory = $false)]
    [string]$RunnerOs 
)

if ($RunnerOs -eq 'Linux') 
{
    $LemonTreePackageURL = "https://nexus.lieberlieber.com/repository/lemontree-release/LemonTree.Automation/LemonTree.Automation.Linux.Zip_latest.zip"
}
elseif ($RunnerOs -eq 'Windows') 
{
    $LemonTreePackageURL  = "https://nexus.lieberlieber.com/repository/lemontree-release/LemonTree.Automation/LemonTree.Automation.Windows.Zip_latest.zip"
}
else 
{
    Write-Output '$RunnerOs is not supported'
    Exit -1
}

Write-Output "Download LemonTree.Automtion from Repo"
# while (Test-Path Alias:curl) {Remove-Item Alias:curl} #remove the alias binding from curl to Invoke-WebRequest
# curl "$LemonTreePackageURL" --output LTA.zip -k
Invoke-WebRequest -URI "$LemonTreePackageURL" -OutFile "LTA.zip"
Write-Output "Download Exit Code: $LASTEXITCODE"

Expand-Archive "LTA.zip" -DestinationPath ".\LTA\" -Force
Write-Output "Unzip Exit Code: $LASTEXITCODE"

IF([string]::IsNullOrWhiteSpace($License)) 
{            
    Write-Output "No License info provided."         
} 
else 
{            
    Write-Output "Create License File from provided info"
    $License | Out-File -FilePath lta.lic #if you deploy the license on the fly
}  

if($LASTEXITCODE -eq 0)
{

    if ($RunnerOs -eq 'Linux') 
    {
        $LemonTreeExe = "./LTA/LemonTree.Automation"
        #workaround because github artifacts logic doesn't maintain properties
        chmod +x $LemonTreeExe            
    }
    elseif ($RunnerOs -eq 'Windows') 
    {
        $LemonTreeExe  = ".\LTA\LemonTree.Automation.exe"
    }

    Write-Output "LemonTreeAutomationExecutable=$LemonTreeExe" >> $env:GITHUB_OUTPUT
   
    exit 0
}
