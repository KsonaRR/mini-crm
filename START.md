# Как пользоваться Mini CRM + виртуальной командой

Ты — **только разработчик**. Планирование, задачи, ревью, roadmap — делают агенты **сами**, без вопросов «можно ли?».

---

## Шаг 1. Открой проект в Cursor

```powershell
cursor C:\Users\dd100\Desktop\mini-crm
```

Или в Cursor: **File → Open Folder** → `C:\Users\dd100\Desktop\mini-crm`

---

## Шаг 2. Проверь окружение (один раз)

В терминале Cursor (`Ctrl+`` `):

```powershell
php -v          # нужен 8.2+
composer -V
git --version
php artisan serve   # http://127.0.0.1:8000 — проверь что Laravel жив
```

**Обязательно для задач с приоритетами в GitHub:**

```powershell
gh auth login
gh repo create mini-crm --public --source=. --remote=origin --push
.\scripts\setup-labels.ps1
```

Без GitHub агенты не смогут создавать задачи — это основной рабочий процесс.

---

## Шаг 3. Запусти команду (одна команда в чате)

```
@team-orchestrator init
```

Оркестратор **сам**:
- проверит PHP, Composer, Git
- настроит `.env` если нужно
- запланирует Sprint 0/1
- PO → BA → Tech Lead → QA (перекрёстные проверки)
- создаст **Issues в GitHub с приоритетами P0–P3**
- запишет зеркало задачи в `team/CURRENT_TASK.md`

---

## Шаг 4. Твой ежедневный цикл (3 действия)

### Утро / выбрать задачу

**GitHub — главный источник.** Список по приоритету:

```powershell
.\scripts\gh-list-tasks.ps1
```

Или в Cursor:

```
@team-orchestrator next        # highest P0→P3
@team-orchestrator pick 5      # конкретный Issue
```

Подробно: **`docs/GITHUB_TASKS.md`**

### Работа

- Открой Issue на GitHub (AC, ветка, приоритет)
- `git checkout -b feature/N-slug`
- Код + тесты
- `@mentor ...` если застрял

### Закончил — push на проверку

```powershell
git push -u origin feature/N-slug
gh pr create --base develop --title "feat: ... Closes #N"
```

```
@team-orchestrator review
```

Агенты **сами**:
- запустят тесты
- QA проверит по Acceptance Criteria
- Tech Lead проверит архитектуру
- дадут **APPROVED** или список правок

Если **APPROVED** — мержишь PR (команда будет в CURRENT_TASK).  
Если **CHANGES_REQUESTED** — правишь и снова `@team-orchestrator review`.

---

## Все команды (шпаргалка)

| Команда в чате Cursor | Когда |
|-----------------------|-------|
| `@team-orchestrator init` | Первый запуск |
| `@team-orchestrator sprint 1` | Запланировать спринт |
| `@team-orchestrator next` | Highest priority из GitHub |
| `@team-orchestrator pick N` | Взять Issue #N |
| `@team-orchestrator review` | После push/PR — проверка |
| `@team-orchestrator status` | Issues по приоритету |
| `@mentor ...` | Не понимаю, подскажи |

**Больше ничего вызывать не нужно** — оркестратор сам дергает PO, BA, Tech Lead, QA, DevOps.

---

## GitHub (когда будешь готов)

```powershell
# На github.com создай пустой репо mini-crm, затем:
git remote add origin https://github.com/YOUR_USER/mini-crm.git
git add .
git commit -m "chore: init mini-crm with autonomous team"
git branch -M main
git checkout -b develop
git push -u origin main
git push -u origin develop
```

Labels — агент выполнит при `init` если есть `gh`, иначе `docs/GITHUB_LABELS.md`.

---

## Notion

1. Notion → Import → Markdown → `notion/ROADMAP.md`
2. Агенты обновляют `notion/ROADMAP.md` в репо; ты синхронизируешь в Notion по желанию

---

## Где что лежит

| Путь | Для кого |
|------|----------|
| `team/CURRENT_TASK.md` | **ТЫ** — читай только это |
| `team/LOG.md` | Журнал команды |
| `team/pipeline/` | Планы, issues, ревью (агенты) |
| `.cursor/skills/` | Роли агентов |
| `notion/ROADMAP.md` | Roadmap |

---

## Схема автономного потока

```
ТЫ: @team-orchestrator sprint 1
         │
         ▼
    [PO] plan ──review──► [BA] ✓
         │
         ▼
    [BA] issues ──review──► [Tech Lead] ✓
         │
         ▼
    [Tech Lead] tech plan ──review──► [QA] ✓
         │
         ▼
    CURRENT_TASK.md  ──►  ТЫ пишешь код
         │
         ▼
ТЫ: @team-orchestrator review
         │
         ▼
    [QA] + [Tech Lead] ──► APPROVED / CHANGES_REQUESTED
         │
         ▼
    next task в CURRENT_TASK.md
```

---

## Частые вопросы

**Агент спрашивает разрешение?**  
Напиши: `работай автономно, см. .cursor/rules/autonomous-team.mdc`

**Не знаю с чего начать?**  
`@team-orchestrator init`

**Застрял в коде?**  
`@mentor Issue #N: не понимаю Policy, пробовал ...`

**Хочу следующую задачу?**  
`@team-orchestrator next`
