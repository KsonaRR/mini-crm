# Injects developer context at session start — read stdin JSON, write stdout JSON
$null = [Console]::In.ReadToEnd()

$taskFile = Join-Path $PSScriptRoot "..\..\team\CURRENT_TASK.md"
$context = ""

if (Test-Path $taskFile) {
    $context = Get-Content $taskFile -Raw -Encoding UTF8
    if ($context.Length -gt 3000) {
        $context = $context.Substring(0, 3000) + "`n... (truncated)"
    }
}

$payload = @{
    continue = $true
    additional_context = @"
## Mini CRM — Autonomous Team (auto-injected)

Human is DEVELOPER ONLY. Do not ask permission. Use @team-orchestrator for planning/review.

### Current developer task (team/CURRENT_TASK.md):
$context

### Rules: .cursor/rules/autonomous-team.mdc
"@
}

$payload | ConvertTo-Json -Compress -Depth 5 | Write-Output
