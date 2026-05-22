param(
    [Parameter(Mandatory = $true)]
    [string]$Destination,

    [string]$TemplateSource = "",
    [switch]$WithEcustTemplate,
    [switch]$WithoutEcustTemplate,
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")
$scaffold = Join-Path $repoRoot "scaffold\thesis-project"
$dest = $Destination

if (-not (Test-Path -LiteralPath $scaffold)) {
    throw "Scaffold not found: $scaffold"
}

if ((Test-Path -LiteralPath $dest) -and -not $Force) {
    $items = Get-ChildItem -LiteralPath $dest -Force -ErrorAction SilentlyContinue
    if ($items.Count -gt 0) {
        throw "Destination exists and is not empty: $dest. Use -Force to merge/overwrite scaffold files."
    }
}

New-Item -ItemType Directory -Force -Path $dest | Out-Null

Copy-Item -Path (Join-Path $scaffold "*") -Destination $dest -Recurse -Force

if (-not $WithoutEcustTemplate) {
    $templateDest = Join-Path $dest "paper\template"
    $prepareScript = Join-Path $PSScriptRoot "prepare-ecust-template.ps1"
    if ([string]::IsNullOrWhiteSpace($TemplateSource)) {
        & $prepareScript -Destination $templateDest -Force
    }
    else {
        & $prepareScript -Destination $templateDest -Source $TemplateSource -Force
    }
}

Push-Location $dest
try {
    if (-not (Test-Path -LiteralPath ".git")) {
        git init | Out-Null
        git add .
        git commit -m "Initialize ECUST thesis project"
    }
}
finally {
    Pop-Location
}

Write-Host "Initialized thesis project at $dest"
