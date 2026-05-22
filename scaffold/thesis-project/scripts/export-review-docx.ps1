param(
    [string]$InputTex = "paper/main.tex",
    [string]$OutputDocx = "docs/export/review-draft.docx"
)

$ErrorActionPreference = "Stop"

$root = Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")
$inputPath = Join-Path $root $InputTex
$outputPath = Join-Path $root $OutputDocx
$outputDir = Split-Path -Parent $outputPath
$inputDir = Split-Path -Parent $inputPath
$inputName = Split-Path -Leaf $inputPath
$tempTex = Join-Path $env:TEMP ("review-export-" + [Guid]::NewGuid().ToString("N") + ".tex")

if (-not (Test-Path -LiteralPath $inputPath)) {
    throw "Cannot find input TeX file: $inputPath"
}

New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

try {
    $lines = Get-Content -LiteralPath $inputPath -Encoding UTF8
    $filtered = New-Object System.Collections.Generic.List[string]
    foreach ($line in $lines) {
        if ($line -match '\\defbibheading\{bibliography\}') {
            continue
        }
        if ($line -match '^\\bfseries\\zihao\{4\}\\heiti\\normalfont\}$') {
            continue
        }
        $filtered.Add($line)
    }
    $content = $filtered -join [Environment]::NewLine
    Set-Content -LiteralPath $tempTex -Value $content -Encoding UTF8

    Push-Location $inputDir
    pandoc $tempTex `
        --from latex `
        --to docx `
        --output $outputPath `
        --resource-path "$root;$inputDir;$root\figures"
}
finally {
    Pop-Location
    Remove-Item -LiteralPath $tempTex -Force -ErrorAction SilentlyContinue
}

Write-Host "Exported Word review draft: $outputPath"
