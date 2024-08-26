# Define the path to the folder you want to move to
$folderPath = "C:\Path\To\Your\Target\Folder"

# Change the current directory to the specified folder
Set-Location -Path $folderPath

# Optional: Print the new current directory to confirm
Write-Output "Current directory is now: $(Get-Location)"
