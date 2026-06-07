# One-time environment check for Mini CRM autonomous team
$ErrorActionPreference = "Continue"
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $root

Write-Host "=== Mini CRM Bootstrap ===" -ForegroundColor Cyan

function Test-Cmd($name, $cmdArgs = @("--version")) {
    $exe = Get-Command $name -ErrorAction SilentlyContinue
    if ($exe) {
        & $name @cmdArgs 2>&1 | Select-Object -First 1 | ForEach-Object { Write-Host "[OK] $name : $_" -ForegroundColor Green }
        return $true
    }
    Write-Host "[MISSING] $name" -ForegroundColor Red
    return $false
}

Test-Cmd "php" @("-v")
Test-Cmd "composer" @("-V")
Test-Cmd "git" @("--version")

$ghOk = Test-Cmd "gh" @("--version")
if ($ghOk) {
    $auth = gh auth status 2>&1
    if ($LASTEXITCODE -eq 0) { Write-Host "[OK] gh authenticated" -ForegroundColor Green }
    else { Write-Host "[WARN] gh not authenticated — issues will be saved to files" -ForegroundColor Yellow }
}

if (-not (Test-Path "vendor/autoload.php")) {
    Write-Host "Running composer install..." -ForegroundColor Yellow
    composer install --no-interaction --quiet
}

if (-not (Test-Path ".env")) {
    Copy-Item ".env.example" ".env"
    php artisan key:generate --no-interaction
}

php artisan migrate --graceful --no-interaction 2>&1 | Out-Null

Write-Host ""
Write-Host "=== Next step in Cursor chat ===" -ForegroundColor Cyan
Write-Host "@team-orchestrator init" -ForegroundColor White
Write-Host ""
Write-Host "Read: START.md | Tasks: GitHub Issues | List: .\scripts\gh-list-tasks.ps1" -ForegroundColor Yellow
if ($ghOk) {
    Write-Host "Setup labels: .\scripts\setup-labels.ps1" -ForegroundColor Yellow
}
