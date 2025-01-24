# Set the target folder path
$folderPath = "C:\Your\Folder\Path" 

# Specify the number of days to consider a file old 
$deleteDays = 30 

# Get all files older than specified days in the folder
$oldFiles = Get-ChildItem -Path $folderPath -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$deleteDays) }

# Display a confirmation message before deleting
Write-Host "About to delete files older than $deleteDays days from '$folderPath'." 
Write-Host "Do you want to continue? (y/n)" 
$confirm = Read-Host 

if ($confirm -eq 'y') {
    # Delete the old files
    Remove-Item -Path $oldFiles.FullName -Force 
    Write-Host "Files deleted successfully!"
} else {
    Write-Host "Deletion cancelled."
}
