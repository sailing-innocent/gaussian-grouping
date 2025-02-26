# Check if the user provided arguments
param(
    [Parameter(Mandatory=$true)]
    [string]$dataset_name,
    
    [Parameter(Mandatory=$true)]
    [string]$scale
)

$dataset_folder = "data/$dataset_name"

# Check if folder exists
if (-not (Test-Path $dataset_folder)) {
    Write-Error "Error: Folder '$dataset_folder' does not exist."
    exit 2
}

# Gaussian Grouping training
python train.py -s $dataset_folder -r $scale -m "output/$dataset_name" --config_file "config/gaussian_dataset/train.json" --train_split

# Segmentation rendering using trained model
python render.py -m "output/$dataset_name" --num_classes 256 --images images