Param (
  [parameter(mandatory=$true)] $src_path,
  [parameter(mandatory=$true)] $dst_dir
)

$ErrorActionPreference = "stop"

$now = Get-Date -Format "yyyyMMdd-HHmmss"
$dst_file = Split-Path $src_path -Leaf
$dst_path = Join-Path $dst_dir ($now + "_" + $dst_file)

Copy-Item -Path $src_path -Destination $dst_path
Clear-Content $src_path

exit 0
