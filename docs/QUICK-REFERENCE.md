# Шпаргалка — автономная команда

## Единственные команды

```
@team-orchestrator init       # первый раз
@team-orchestrator next        # что делать
@team-orchestrator review      # проверь мой код
@team-orchestrator sprint 2    # новый спринт
@team-orchestrator status        # статус
```

## Я застрял

```
@mentor Issue #3: не понимаю Policy. Пробовал: ...
```

## Задачи

GitHub Issues (P0→P3): `.\scripts\gh-list-tasks.ps1`

`team/CURRENT_TASK.md` — зеркало текущей задачи

Подробно: `docs/GITHUB_TASKS.md`

## Git (ты)

```bash
git checkout develop
git pull
git checkout -b feature/3-contacts-crud
# ... код ...
git add .
git commit -m "feat(contacts): add CRUD with validation"
git push -u origin feature/3-contacts-crud
gh pr create --base develop --title "feat(contacts): CRUD" --body "Closes #3"
```
