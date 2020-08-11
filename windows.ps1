$releases = "https://api.github.com/repos/dops-cli/dops/releases"

Write-Host Determining latest release
$tag = (Invoke-WebRequest $releases | ConvertFrom-Json)[0].tag_name

$download = "https://github.com/dops-cli/dops/releases/download/$tag/dops_Windows_x86_64.zip"
$name = "dops_Windows_x86_64"
$zip = "$env:TEMP\$name-$tag.zip"
$dir = "$name-$tag"

Write-Host Dowloading latest release
Invoke-WebRequest $download -Out $zip

Write-Host Extracting release files
Expand-Archive $zip -DestinationPath "$Env:Programfiles\dops" -Force

Write-Host Cleaning up target dir
Remove-Item $name -Recurse -Force -ErrorAction SilentlyContinue

Write-Host Updating path
[Environment]::SetEnvironmentVariable(
        "Path",
        [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";$Env:Programfiles\dops",
        [EnvironmentVariableTarget]::Machine)

Write-Host Dops successfully installed!