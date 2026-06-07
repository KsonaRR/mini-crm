# Виртуальная команда Mini CRM (автономный режим)

Ты — **только разработчик**. Команда работает **сама**: планирует, создаёт задачи, проверяет друг друга и тебя. **Без вопросов «можно ли?».**

## Главная команда

```
@team-orchestrator init      — первый запуск
@team-orchestrator sprint 1  — создать Issues с приоритетами в GitHub
@team-orchestrator next       — highest P0→P3 из GitHub
@team-orchestrator pick N     — взять Issue #N
@team-orchestrator review     — после push/PR
@team-orchestrator status     — Issues по приоритету
```

Полная инструкция: **[START.md](START.md)**

## Где брать задачи

**GitHub Issues** — основной источник (приоритеты P0→P3).

```powershell
.\scripts\gh-list-tasks.ps1
```

Зеркало текущей задачи: **`team/CURRENT_TASK.md`**

Инструкция: **`docs/GITHUB_TASKS.md`**

## Команда (работает через оркестратор)

| Роль | Проверяет | Проверяют его |
|------|-----------|---------------|
| Product Owner | — | Business Analyst |
| Business Analyst | PO | Tech Lead |
| Tech Lead | BA | QA (+ DevOps) |
| DevOps | Tech (infra) | — |
| QA | Tech plan + код разработчика | — |
| Ментор | — | только подсказки тебе |

## Цикл (автоматический)

```
@team-orchestrator sprint N
  → PO → BA review → Issues → Tech Lead review
  → Tech plan → QA review → CURRENT_TASK.md

ТЫ: код + тесты

@team-orchestrator review
  → QA + Tech Lead → APPROVED / CHANGES_REQUESTED
  → следующая задача в CURRENT_TASK.md
```

## Помощь в коде

```
@mentor Issue #3: не понимаю Form Request, пробовал ...
```

## Артефакты команды

| Путь | Содержимое |
|------|------------|
| `team/CURRENT_TASK.md` | Задача для тебя |
| `team/LOG.md` | Журнал |
| `team/pipeline/` | Планы, issues, ревью |
| `notion/ROADMAP.md` | Roadmap |
