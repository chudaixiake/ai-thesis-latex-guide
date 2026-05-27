# Remove duplicate nested font directories in template/.
# These are copies of fonts already at the parent level.

$ErrorActionPreference = "Stop"
$repoRoot = Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")

Write-Host "Cleaning duplicate nested fonts in $repoRoot\template\ ..."

$duplicates = @(
    "template\SimSun\SimSun",
    "template\SimHei\SimHei",
    "template\KaiTi\KaiTi"
)

foreach ($dup in $duplicates) {
    $target = Join-Path $repoRoot $dup
    if (Test-Path -LiteralPath $target) {
        Remove-Item -LiteralPath $target -Recurse -Force
        Write-Host "  Removed: $dup" -ForegroundColor Green
    } else {
        Write-Host "  Already clean: $dup" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Done. Remaining font files:" -ForegroundColor Cyan
Get-ChildItem -Path (Join-Path $repoRoot "template") -Recurse -Include "*.TTF","*.TTC" |
    ForEach-Object { Write-Host "  $($_.FullName)" }
