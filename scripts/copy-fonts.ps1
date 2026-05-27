# Copy system CJK fonts to project template directory
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

$dirs = @(
    "$root\paper\template\SimSun",
    "$root\paper\template\SimHei",
    "$root\paper\template\KaiTi"
)
foreach ($d in $dirs) {
    New-Item -ItemType Directory -Force -Path $d | Out-Null
}

$map = @(
    @{ Src = "C:\Windows\Fonts\simsun.ttc";  Dst = "$root\paper\template\SimSun\SIMSUN.TTC" },
    @{ Src = "C:\Windows\Fonts\simhei.ttf";   Dst = "$root\paper\template\SimHei\SIMHEI.TTF" },
    @{ Src = "C:\Windows\Fonts\STKAITI.TTF";  Dst = "$root\paper\template\KaiTi\SIMKAI.TTF" }
)

foreach ($m in $map) {
    Copy-Item -LiteralPath $m.Src -Destination $m.Dst -Force
    Write-Host "  Copied: $(Split-Path -Leaf $m.Dst)" -ForegroundColor Green
}

Write-Host "`nDone. Re-run check-latex-env.ps1 to verify." -ForegroundColor Cyan
