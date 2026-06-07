# Задачи в GitHub — твой рабочий процесс

**GitHub Issues — единственный источник задач.** Агенты сами создают Issues с приоритетами. Ты берёшь оттуда, делаешь, пушишь на проверку.

---

## Приоритеты

| Приоритет | Label | Бери когда |
|-----------|-------|------------|
| P0 | `priority: P0` | Срочно, блокирует остальное |
| P1 | `priority: P1` | MVP, основной фокус |
| P2 | `priority: P2` | После P0/P1 |
| P3 | `priority: P3` | Когда всё важное сделано |

**Порядок работы:** P0 → P1 → P2 → P3

---

## Как взять задачу

### Вариант A — GitHub (основной)

1. Открой репозиторий → **Issues**
2. Фильтр: `label:"status: ready"` + сортируй по приоритету в заголовке `[P1]`
3. Или в терминале:

```powershell
.\scripts\gh-list-tasks.ps1
```

4. Открой Issue — там User Story, AC, ветка, tech plan (в комментарии или pipeline)
5. Назначь себя (Assignees) — или:

```
@team-orchestrator pick 5
```

### Вариант B — автоматически highest priority

```
@team-orchestrator next
```

Возьмёт верхнюю `status: ready` по приоритету P0→P3.

---

## Цикл задачи

```
GitHub Issue (status: ready, priority: P1)
        │
        ▼
Взял в работу → status: in-progress
        │
        ▼
git checkout -b feature/5-slug
код + тесты
        │
        ▼
git push + gh pr create
status: review
        │
        ▼
@team-orchestrator review
        │
        ▼
APPROVED → merge → status: done
CHANGES_REQUESTED → правки → review снова
```

---

## Push на проверку

```powershell
git add .
git commit -m "feat(auth): login and register Closes #5"
git push -u origin feature/5-auth-login

gh pr create --base develop --title "feat(auth): login Closes #5" --body "Closes #5"
```

Затем в Cursor:

```
@team-orchestrator review
```

Агенты сами поставят `status: review` → после approve `status: done`.

---

## Фильтры GitHub (сохрани в закладки)

```
is:open label:"status: ready" sort:created-asc
is:open label:"priority: P1" label:"status: ready"
is:open assignee:@me label:"status: in-progress"
```

---

## Кто создаёт задачи

| Кто | Что |
|-----|-----|
| `@team-orchestrator sprint N` | Создаёт все Issues спринта с приоритетами |
| `@team-orchestrator init` | Labels + первый спринт |
| BA (через оркестратор) | `gh issue create` с body и labels |

Ты **не создаёшь** задачи — только выполняешь и пушишь.

---

## Что внутри Issue

Каждая задача содержит:

- **Priority** (в title `[P1]` и label)
- User Story
- Acceptance Criteria (чеклист)
- Branch name
- Test scenarios
- Ссылка на tech plan в `team/pipeline/` (комментарий от оркестратора)
