# GitHub Labels

Агенты создают labels автоматически при `init`. Или вручную:

```powershell
.\scripts\setup-labels.ps1
```

## Приоритеты (обязательно на каждой задаче)

| Label | Значение | Когда ставить |
|-------|----------|---------------|
| `priority: P0` | Critical — блокер, без этого нельзя двигаться | Auth, CI, критичные баги |
| `priority: P1` | High — MVP, делать в первую очередь | Основные фичи спринта |
| `priority: P2` | Medium — важно, но после P0/P1 | Улучшения, вторичные фичи |
| `priority: P3` | Low — backlog, когда есть время | Nice-to-have |

**Правило:** у Issue ровно **один** priority-label.

## Статусы

| Label | Значение |
|-------|----------|
| `status: backlog` | В очереди, ещё не готова к разработке |
| `status: ready` | Готова — бери в работу |
| `status: in-progress` | Разработчик работает |
| `status: review` | PR открыт, ждёт QA |
| `status: done` | Смержено |

## Тип и область

```
type: feature | type: bug | type: chore
area: auth | contacts | deals | tasks | dashboard | infra
```

## Формат заголовка Issue (агенты)

```
[P1][auth] feat: регистрация и вход пользователей
[P0][infra] chore: GitHub Actions CI pipeline
[P2][contacts] feat: теги контактов
```

## Создание Issue агентом

```bash
gh issue create \
  --title "[P1][auth] feat: регистрация и вход" \
  --label "priority: P1,type: feature,status: ready,area: auth" \
  --body-file team/pipeline/sprint-1/issues/issue-auth-login.md
```
