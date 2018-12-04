Param (
  [parameter(mandatory=$true)] $config_file,
  [parameter(mandatory=$true)] $dst_dir
)

$ErrorActionPreference = "stop"

$now = Get-Date -Format "yyyyMMdd-HHmmss"
$dst_path = Join-Path $dst_dir ($now + "_backup.zip")

$target_files = Get-Content $config_file
$count = 0
foreach ($target_file in $target_files) {
  if ($count -eq 0) {
    Compress-Archive -Path $target_file -Destination $dst_path
  } else {
    Compress-Archive -Path $target_file -Destination $dst_path -Update
  }
  $count += 1
}

exit 0
