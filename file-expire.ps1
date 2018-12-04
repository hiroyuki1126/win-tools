Param (
  [parameter(mandatory=$true)] $file_path,
  [parameter(mandatory=$true)] $file_gen
)

$ErrorActionPreference = "stop"

Get-ChildItem $file_path |
Sort-Object LastWriteTime -Descending |
Select-Object -Skip $file_gen |
foreach { Remove-Item $_.FullName }

exit 0
