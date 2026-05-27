# Build thesis PDF using latexmk + xelatex.
# Usage:
#   scripts\build.ps1                          # build template/main.tex
#   scripts\build.ps1 -Target paper\main.tex   # build a specific file
#   scripts\build.ps1 -Clean                   # remove build artifacts

param(
    [string]$Target = "template\main.tex",
    [switch]$Clean
)

$ErrorActionPreference = "Stop"
$root = Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")

$targetPath = Join-Path $root $Target
if (-not (Test-Path -LiteralPath $targetPath)) {
    throw "Target not found: $targetPath"
}

$targetDir = Split-Path -Parent $targetPath
$targetFile = Split-Path -Leaf $targetPath

Push-Location $targetDir
try {
    if ($Clean) {
        Write-Host "Cleaning build artifacts in $targetDir ..." -ForegroundColor Cyan
        latexmk -C $targetFile
        Write-Host "Clean complete." -ForegroundColor Green
    }
    else {
        Write-Host "Building $Target with xelatex ..." -ForegroundColor Cyan
        latexmk -xelatex $targetFile
        if ($LASTEXITCODE -eq 0) {
            $pdf = [System.IO.Path]::ChangeExtension($targetFile, ".pdf")
            Write-Host "Build successful: $targetDir\$pdf" -ForegroundColor Green
        }
        else {
            Write-Host "Build failed. Check the log for errors." -ForegroundColor Red
            exit 1
        }
    }
}
finally {
    Pop-Location
}
