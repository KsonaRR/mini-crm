# Workflow: автономная команда

> Разработчик не участвует в планировании. Точка входа: `@team-orchestrator`.

## Роли и ответственность

### Product Owner (`@product-owner`)
- Roadmap в Notion
- Приоритеты (Must / Should / Could)
- Definition of Done на уровне продукта

### Business Analyst (`@business-analyst`)
- User stories: «Как [роль], я хочу [действие], чтобы [ценность]»
- Acceptance criteria (Given / When / Then)
- Текст GitHub Issue готовый к созданию

### Tech Lead (`@tech-lead`)
- Модели, миграции, контроллеры, маршруты
- Список файлов для изменения
- Риски и зависимости между задачами

### DevOps (`@devops-engineer`)
- Dockerfile, docker-compose
- GitHub Actions
- Чеклист деплоя

### QA Reviewer (`@qa-reviewer`)
- Ревью по Issue и acceptance criteria
- Вердикт: **APPROVED** | **CHANGES_REQUESTED** | **NEEDS_DISCUSSION**
- Конкретные замечания с файлом и строкой

### Mentor (`@mentor`)
- Объяснения без полного решения за тебя
- Подсказки, ссылки на доки Laravel
- Мини-примеры кода только если ты застрял

## Статусы Issue (GitHub)

| Label | Значение |
|-------|----------|
| `status: backlog` | В очереди |
| `status: ready` | Готово к разработке |
| `status: in-progress` | Ты в работе |
| `status: review` | PR открыт, ждёт QA |
| `status: done` | Смержено |

## Статусы PR

1. Draft — работаешь
2. Ready for review — вызываешь `@qa-reviewer`
3. Changes requested — правишь по замечаниям
4. Approved — мержишь в `develop`

## Чеклист разработчика (ты)

- [ ] Прочитал `team/CURRENT_TASK.md`
- [ ] Ветка из CURRENT_TASK от `develop`
- [ ] Код + тесты
- [ ] `php artisan test` проходит
- [ ] PR с `Closes #N` (если GitHub подключён)
- [ ] `@team-orchestrator review` в чате

## Перекрёстное ревью (агенты, без тебя)

| Этап | Автор | Ревьюер |
|------|-------|---------|
| Sprint plan | PO | BA |
| Issues | BA | Tech Lead |
| Tech plan | Tech Lead | QA (+ DevOps) |
| Код | Developer | QA + Tech Lead |

## Когда спрашивать ментора

- Не понимаешь термин из Issue
- Не знаешь, с какого файла начать
- Ошибка Laravel непонятна
- Нужен обзор паттерна (Repository, Policy, Form Request)

Формат: `@mentor [Issue #N] Вопрос: ... Что уже пробовал: ...`
