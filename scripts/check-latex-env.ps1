$ErrorActionPreference = "Continue"

$commands = @("xelatex", "biber", "latexmk", "kpsewhich")

foreach ($command in $commands) {
    Write-Host "== $command =="
    $path = Get-Command $command -ErrorAction SilentlyContinue
    if ($null -eq $path) {
        Write-Host "NOT FOUND" -ForegroundColor Red
        continue
    }
    Write-Host $path.Source
}

Write-Host ""
Write-Host "Version checks:"

try { xelatex --version | Select-Object -First 1 } catch {}
try { biber --version } catch {}
try { latexmk -version | Select-Object -First 2 } catch {}
