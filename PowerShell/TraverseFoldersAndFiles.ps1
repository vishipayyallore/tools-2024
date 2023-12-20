param(
    [string]$path
)

$ignoreList = @("bin", "obj")

function Get-FolderAndFiles($folderPath, $indentLevel) {
    $items = Get-ChildItem $folderPath

    foreach ($item in $items) {
        $indent = ' ' * $indentLevel
        if ($item.PSIsContainer) {
            # Check if the folder is in the ignore list
            if ($ignoreList -notcontains $item.Name) {
                # It's a folder, so recurse into it
                Write-Host "$indent|_ $($item.Name)" -ForegroundColor Blue
                Get-FolderAndFiles $item.FullName ($indentLevel + 1)
            }
        } else {
            # Check if the file is in the ignore list
            if ($ignoreList -notcontains $item.Name) {
                # It's a file, print its path
                Write-Host "$indent|__$($item.Name)" -ForegroundColor Green
            }
        }
    }
}

# Check if the provided path exists
if (Test-Path $path -PathType Container) {
    Write-Host "Traversing folders and files in: $path" -ForegroundColor Yellow
    Get-FolderAndFiles $path 0
} else {
    Write-Error "Provided path does not exist: $path"
}
