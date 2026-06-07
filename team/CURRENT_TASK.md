# Текущая задача разработчика

**Статус:** NO_ACTIVE_TASK

Задачи живут в **GitHub Issues** с приоритетами. Агенты создают их сами.

## Что сделать

1. Подключи GitHub:

```powershell
gh auth login
.\scripts\setup-labels.ps1
```

2. В Cursor:

```
@team-orchestrator init
```

3. Смотри задачи:

```powershell
.\scripts\gh-list-tasks.ps1
```

4. Возьми задачу:

```
@team-orchestrator next
```

или открой Issue на GitHub с `status: ready` — начни с **P0**, потом P1.

5. После кода → push → PR → `@team-orchestrator review`

---

**Полная инструкция:** [docs/GITHUB_TASKS.md](../docs/GITHUB_TASKS.md)
