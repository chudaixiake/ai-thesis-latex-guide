$ErrorActionPreference = "Continue"

Write-Host "=== LaTeX Toolchain ===" -ForegroundColor Cyan
$latexCommands = @("xelatex", "biber", "latexmk", "kpsewhich")
foreach ($command in $latexCommands) {
    $path = Get-Command $command -ErrorAction SilentlyContinue
    if ($null -eq $path) {
        Write-Host "  $command : NOT FOUND" -ForegroundColor Red
    } else {
        Write-Host "  $command : $($path.Source)" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "=== Pandoc (Word export) ===" -ForegroundColor Cyan
$pandoc = Get-Command pandoc -ErrorAction SilentlyContinue
if ($null -eq $pandoc) {
    Write-Host "  pandoc : NOT FOUND" -ForegroundColor Red
    Write-Host "  Install from https://pandoc.org/installing.html for Word export support." -ForegroundColor Yellow
} else {
    Write-Host "  pandoc : $($pandoc.Source)" -ForegroundColor Green
    try { pandoc --version | Select-Object -First 1 } catch {}
}

Write-Host ""
Write-Host "=== Version Info ===" -ForegroundColor Cyan
try { xelatex --version | Select-Object -First 1 } catch {}
try { biber --version } catch {}
try { latexmk -version | Select-Object -First 2 } catch {}

Write-Host ""
Write-Host "=== CJK Fonts ===" -ForegroundColor Cyan
$fonts = @("SimSun", "SimHei", "KaiTi")
foreach ($font in $fonts) {
    $found = Get-ChildItem -Path "C:\Windows\Fonts" -Filter "*$font*" -ErrorAction SilentlyContinue
    if ($found) {
        Write-Host "  $font : FOUND ($($found.Name -join ', '))" -ForegroundColor Green
    } else {
        Write-Host "  $font : NOT FOUND in system fonts" -ForegroundColor Yellow
        Write-Host "    The project bundles fonts in paper/template/ — this is OK for LaTeX." -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "=== Project Fonts (paper/template/) ===" -ForegroundColor Cyan
$templateFonts = @(
    "paper\template\SimSun\SIMSUN.TTC",
    "paper\template\SimHei\SIMHEI.TTF",
    "paper\template\KaiTi\SIMKAI.TTF"
)
foreach ($f in $templateFonts) {
    if (Test-Path -LiteralPath $f) {
        Write-Host "  $f : OK" -ForegroundColor Green
    } else {
        Write-Host "  $f : MISSING" -ForegroundColor Red
    }
}
