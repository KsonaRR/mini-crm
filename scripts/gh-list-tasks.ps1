# List GitHub issues sorted by priority (P0 first) — developer task board
param(
    [ValidateSet("ready", "in-progress", "review", "all")]
    [string]$Status = "ready"
)

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "gh CLI required. Install and run: gh auth login" -ForegroundColor Red
    exit 1
}

$priorityOrder = @{ "priority: P0" = 0; "priority: P1" = 1; "priority: P2" = 2; "priority: P3" = 3 }

$query = "repo:$(gh repo view --json nameWithOwner -q .nameWithOwner) is:issue is:open"
if ($Status -ne "all") {
    $query += " label:`"status: $Status`""
}

$issues = gh issue list --limit 100 --json number,title,labels,url --jq '.' | ConvertFrom-Json

$sorted = $issues | ForEach-Object {
    $p = 99
    foreach ($lbl in $_.labels) {
        if ($priorityOrder.ContainsKey($lbl.name)) { $p = $priorityOrder[$lbl.name]; break }
    }
    [PSCustomObject]@{ Priority = $p; Number = $_.number; Title = $_.title; Url = $_.url }
} | Sort-Object Priority, Number

if (-not $sorted) {
    Write-Host "No open issues with status: $Status" -ForegroundColor Yellow
    Write-Host "Run in Cursor: @team-orchestrator sprint 1" -ForegroundColor Cyan
    exit 0
}

Write-Host "`n=== Mini CRM Tasks (status: $Status, by priority) ===`n" -ForegroundColor Cyan
foreach ($i in $sorted) {
    $badge = switch ($i.Priority) { 0 { "P0" } 1 { "P1" } 2 { "P2" } 3 { "P3" } default { "??" } }
    Write-Host "#$($i.Number) [$badge] $($i.Title)" -ForegroundColor White
    Write-Host "   $($i.Url)" -ForegroundColor DarkGray
}
Write-Host "`nPick: open issue on GitHub, or @team-orchestrator pick ISSUE_NUMBER" -ForegroundColor Yellow
