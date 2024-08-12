# Usage: .\ListStructure.ps1 -Path "C:\Project1"
# Usage: PowerShell.exe -ExecutionPolicy Bypass -File "D:\GitHub\tools-2024\PowerShell\ListStructure.ps1" -Path "D:\TSA\travels-flask-azoai-api"
# Usage: PowerShell.exe -ExecutionPolicy Bypass -File "D:\GitHub\tools-2024\PowerShell\ListStructure.ps1" -Path .
param (
    [string]$Path = (Get-Location),
    [string[]]$ExcludedFolders = @("node_modules", ".next", "bin", "obj", "__pycache__", ".venv", ".angular", ".vscode")
)

function Get-DirectoryStructure {
    param (
        [string]$Path,
        [string]$Indent = ''
    )
    
    $items = Get-ChildItem $Path

    foreach ($item in $items) {
        # Check if the current item should be excluded
        if ($item.Name -in $ExcludedFolders) {
            continue  # Skip this folder
        }

        Write-Host "$Indent- $($item.Name)"

        if ($item.PSIsContainer) {
            Get-DirectoryStructure -Path $item.FullName -Indent "$Indent  "
        }
    }
}

Write-Host "Displaying the Directory Structure of ", $Path
Get-DirectoryStructure -Path $Path
