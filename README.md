# Mini CRM

Pet-проект: мини-CRM на **Laravel** с **автономной виртуальной командой** в Cursor.

Ты — **только разработчик**. Команда планирует, создаёт Issues, ревьюит — **без запросов разрешения**.

## Быстрый старт

```powershell
cd C:\Users\dd100\Desktop\mini-crm
.\scripts\bootstrap.ps1
cursor .
```

В чате Cursor:

```
@team-orchestrator init
```

**Полная инструкция → [START.md](START.md)**

## Документация команды

| Файл | Описание |
|------|----------|
| [TEAM.md](TEAM.md) | Роли агентов и как вызывать |
| [docs/WORKFLOW.md](docs/WORKFLOW.md) | Полный цикл задачи |
| [docs/BRANCHING.md](docs/BRANCHING.md) | Git-ветки |
| [notion/ROADMAP.md](notion/ROADMAP.md) | Roadmap для Notion |

## Команды (достаточно одной)

```
@team-orchestrator init      — первый запуск
@team-orchestrator next       — что делать сейчас
@team-orchestrator review     — проверить код
@mentor ...                   — подсказка если застрял
```

Текущая задача всегда в **`team/CURRENT_TASK.md`**

## GitHub

1. Создай репозиторий `mini-crm` на GitHub
2. Создай labels: см. [docs/GITHUB_LABELS.md](docs/GITHUB_LABELS.md)
3. Push:

```bash
git init
git add .
git commit -m "chore: init mini-crm with Laravel and virtual team"
git branch -M main
git checkout -b develop
git remote add origin https://github.com/YOUR_USER/mini-crm.git
git push -u origin main
git push -u origin develop
```

## Стек

- PHP 8.3, Laravel 13
- SQLite (dev) / MySQL (prod)
- GitHub Issues + Actions
- Notion — roadmap
