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
    # somehow nexus is super slow on windows-latest
    # $LemonTreePackageURL  = "https://nexus.lieberlieber.com/repository/lemontree-release/LemonTree.Automation/LemonTree.Automation.Windows.Zip_latest.zip"
    $LemonTreePackageURL  = "https://www.lieberlieber.com/lemontree/automation/latest"
}
else 
{
    Write-Output '$RunnerOs is not supported'
    Exit -1
}

Write-Output "Download LemonTree.Automtion from Repo"

Invoke-WebRequest -URI "$LemonTreePackageURL" -OutFile "LTA.zip"
Expand-Archive "LTA.zip" -DestinationPath ".\LTA\" -Force


if([string]::IsNullOrWhiteSpace($License)) 
{            
    Write-Output "No License info provided."         
} 
else 
{            
    Write-Output "Create License File from provided info"
    $License | Out-File -FilePath lta.lic #if you deploy the license on the fly
}  

if ($RunnerOs -eq 'Linux') 
{
    $LemonTreeExe = "./LTA/lemontree.automation"
    #workaround because github artifacts logic doesn't maintain properties
    chmod +x $LemonTreeExe            
}
elseif ($RunnerOs -eq 'Windows') 
{
    $LemonTreeExe  = ".\LTA\LemonTree.Automation.exe"
}

if (Test-Path -path $LemonTreeExe)
{
    #Just to be sure if the executeable is not available - let's throw exitcode 1

    Write-Output "LemonTreeAutomationExecutable=$LemonTreeExe" >> $env:GITHUB_OUTPUT

    exit 0
}
else 
{
   Write-Output "Executable not found LemonTreeAutomationExecutable=$LemonTreeExe"
    
   exit 1
}