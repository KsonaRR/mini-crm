# Create all GitHub labels for Mini CRM (idempotent)
$ErrorActionPreference = "Continue"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "gh CLI not found. Install: https://cli.github.com/" -ForegroundColor Red
    exit 1
}

$labels = @(
    @{ name = "priority: P0"; color = "B60205"; description = "Critical - do first" },
    @{ name = "priority: P1"; color = "D93F0B"; description = "High - MVP" },
    @{ name = "priority: P2"; color = "FBCA04"; description = "Medium" },
    @{ name = "priority: P3"; color = "C5DEF5"; description = "Low - backlog" },
    @{ name = "type: feature"; color = "1D76DB"; description = "New feature" },
    @{ name = "type: bug"; color = "D73A4A"; description = "Bug fix" },
    @{ name = "type: chore"; color = "FEF2C0"; description = "Maintenance" },
    @{ name = "status: backlog"; color = "EDEDED"; description = "Not ready" },
    @{ name = "status: ready"; color = "0E8A16"; description = "Ready for dev" },
    @{ name = "status: in-progress"; color = "FBCA04"; description = "In progress" },
    @{ name = "status: review"; color = "5319E7"; description = "PR in review" },
    @{ name = "status: done"; color = "1D76DB"; description = "Merged" },
    @{ name = "area: auth"; color = "C5DEF5"; description = "Authentication" },
    @{ name = "area: contacts"; color = "C5DEF5"; description = "Contacts" },
    @{ name = "area: deals"; color = "C5DEF5"; description = "Deals" },
    @{ name = "area: tasks"; color = "C5DEF5"; description = "Tasks" },
    @{ name = "area: dashboard"; color = "C5DEF5"; description = "Dashboard" },
    @{ name = "area: infra"; color = "C5DEF5"; description = "Infrastructure" }
)

foreach ($l in $labels) {
    gh label create $l.name --color $l.color --description $l.description --force 2>&1 | Out-Null
    Write-Host "[OK] $($l.name)" -ForegroundColor Green
}

Write-Host "`nLabels ready. View tasks: .\scripts\gh-list-tasks.ps1" -ForegroundColor Cyan
