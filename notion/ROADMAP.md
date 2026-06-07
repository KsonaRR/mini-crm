# Mini CRM — Product Roadmap

> Импорт в Notion: создай страницу «Mini CRM Roadmap», вставь блоки ниже или используй Import → Markdown.

---

## Vision

Простая CRM для малого бизнеса: контакты, сделки, задачи, дашборд. Pet-проект для обучения Laravel с виртуальной командой AI-агентов.

**Стек:** Laravel, MySQL, Blade, GitHub, Cursor Agents

---

## Phase 0 — Setup (Sprint 0)

| Feature | Priority | Status | GitHub Issue | Sprint |
|---------|----------|--------|--------------|--------|
| Repo + virtual team workflow | Must | Done | — | 0 |
| Laravel init + auth scaffold | Must | Planned | TBD | 0 |
| CI pipeline (GitHub Actions) | Must | Planned | TBD | 0 |
| Docker local environment | Should | Planned | TBD | 0 |

**DoD Phase 0:** `php artisan test` green, CI on push, README + TEAM.md

---

## Phase 1 — MVP (Sprints 1–3)

### Epic: Authentication

| Feature | Priority | Status | Issue | Sprint |
|---------|----------|--------|-------|--------|
| Регистрация / логин | Must | Planned | #1 | 1 |
| Роли admin / manager | Must | Planned | #2 | 1 |
| Профиль пользователя | Could | Backlog | — | — |

**User value:** Безопасный доступ, разграничение прав.

---

### Epic: Contacts

| Feature | Priority | Status | Issue | Sprint |
|---------|----------|--------|-------|--------|
| CRUD контактов | Must | Planned | #3 | 1 |
| Поиск и фильтры | Must | Planned | #4 | 2 |
| Теги контактов | Should | Planned | #5 | 2 |

**User value:** Единая база клиентов.

---

### Epic: Deals (Сделки)

| Feature | Priority | Status | Issue | Sprint |
|---------|----------|--------|-------|--------|
| CRUD сделок | Must | Planned | #6 | 2 |
| Воронка статусов | Must | Planned | #7 | 2 |
| Привязка к контакту | Must | Planned | #8 | 2 |

**Статусы:** lead → qualified → proposal → won / lost

---

### Epic: Tasks

| Feature | Priority | Status | Issue | Sprint |
|---------|----------|--------|-------|--------|
| CRUD задач | Must | Planned | #9 | 3 |
| Дедлайны и статусы | Must | Planned | #10 | 3 |
| Связь с контактом/сделкой | Must | Planned | #11 | 3 |

---

### Epic: Dashboard

| Feature | Priority | Status | Issue | Sprint |
|---------|----------|--------|-------|--------|
| Счётчики (контакты, сделки, задачи) | Must | Planned | #12 | 3 |
| Последние активности | Should | Planned | #13 | 3 |

---

## Phase 2 — Post-MVP (Backlog)

| Feature | Priority |
|---------|----------|
| Email-напоминания по задачам | Should |
| Экспорт контактов CSV | Could |
| REST API | Could |
| Тёмная тема | Could |

---

## Sprint calendar (пример)

| Sprint | Даты | Goal |
|--------|------|------|
| 0 | Неделя 1 | Инфраструктура + auth scaffold |
| 1 | Неделя 2–3 | Auth + Contacts CRUD |
| 2 | Неделя 4–5 | Deals + Contacts search/tags |
| 3 | Неделя 6–7 | Tasks + Dashboard |

---

## Связь с GitHub

- Каждая строка Planned → Issue через `@business-analyst`
- Status: Backlog → Ready → In Progress → Review → Done
- Обновляй Issue # колонку после создания Issues
