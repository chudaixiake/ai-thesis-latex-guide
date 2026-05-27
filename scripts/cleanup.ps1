# One-time cleanup: remove font duplicates and stale build artifacts in template/
$ErrorActionPreference = "Stop"
$root = Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")

Write-Host "=== Removing duplicate fonts from template/ ===" -ForegroundColor Cyan
$fontDirs = @("template\SimSun", "template\SimHei", "template\KaiTi")
foreach ($d in $fontDirs) {
    $target = Join-Path $root $d
    if (Test-Path -LiteralPath $target) {
        Remove-Item -LiteralPath $target -Recurse -Force
        Write-Host "  Removed: $d" -ForegroundColor Green
    } else {
        Write-Host "  Already clean: $d" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "=== Removing stale build artifacts ===" -ForegroundColor Cyan
$artifacts = Get-ChildItem -Path (Join-Path $root "template") -Filter "*-SAVE-ERROR" -ErrorAction SilentlyContinue
if ($artifacts) {
    foreach ($a in $artifacts) {
        Remove-Item -LiteralPath $a.FullName -Force
        Write-Host "  Removed: $($a.Name)" -ForegroundColor Green
    }
} else {
    Write-Host "  No stale artifacts found." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Renaming bib_template.bib -> references.bib ===" -ForegroundColor Cyan
$oldBib = Join-Path $root "format\template\ecust-master\bib_template.bib"
$newBib = Join-Path $root "format\template\ecust-master\references.bib"
if ((Test-Path -LiteralPath $oldBib) -and -not (Test-Path -LiteralPath $newBib)) {
    Rename-Item -LiteralPath $oldBib -NewName "references.bib"
    Write-Host "  Renamed bib_template.bib -> references.bib" -ForegroundColor Green
} elseif (Test-Path -LiteralPath $newBib) {
    Write-Host "  references.bib already exists, removing old file if present." -ForegroundColor Yellow
    if (Test-Path -LiteralPath $oldBib) {
        Remove-Item -LiteralPath $oldBib -Force
        Write-Host "  Removed old bib_template.bib" -ForegroundColor Green
    }
} else {
    Write-Host "  bib_template.bib not found." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Done. Run 'powershell -ExecutionPolicy Bypass -File scripts\check-latex-env.ps1' to verify." -ForegroundColor Cyan
