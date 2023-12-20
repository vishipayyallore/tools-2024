param(
    [string]$path
)

function Traverse-Folder($folderPath) {
    $items = Get-ChildItem $folderPath

    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            # It's a folder, so recurse into it
            Traverse-Folder $item.FullName
        } else {
            # It's a file, print its path
            Write-Output $item.FullName
        }
    }
}

# Check if the provided path exists
if (Test-Path $path -PathType Container) {
    Write-Output "Traversing folders and files in: $path"
    Traverse-Folder $path
} else {
    Write-Error "Provided path does not exist: $path"
}
