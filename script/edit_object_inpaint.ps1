param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$output_folder,
    
    [Parameter(Mandatory=$true, Position=1)]
    [string]$config_file
)

# Check if correct number of arguments was provided
if ($args.Count -ne 0) {
    Write-Host "Usage: .\edit_object_inpaint.ps1 <output_folder> <config_file>"
    exit 1
}

# Check if output folder exists
if (-not (Test-Path -Path $output_folder -PathType Container)) {
    Write-Host "Error: Folder '$output_folder' does not exist."
    exit 2
}

# Remove the selected object
python edit_object_inpaint.py -m $output_folder --config_file $config_file