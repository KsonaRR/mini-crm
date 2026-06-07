# Sprint 1 — готовые задачи (черновик для BA)

После создания репо на GitHub попроси `@business-analyst` оформить эти задачи как Issues, или создай вручную.

---

## Issue 1 — Auth: Login / Register

**Title:** `feat(auth): регистрация и вход пользователей`

**Branch:** `feature/1-auth-login`

**Story:** Как менеджер, я хочу войти в CRM, чтобы видеть только свои данные.

**AC:**
- [ ] Страницы `/login`, `/register`
- [ ] После входа редирект на `/dashboard`
- [ ] Невалидные данные — сообщения об ошибках
- [ ] Feature test: успешный login, неуспешный login

---

## Issue 2 — Auth: Roles

**Title:** `feat(auth): роли admin и manager`

**Branch:** `feature/2-auth-roles`

**Depends on:** #1

**AC:**
- [ ] Поле `role` у User: admin | manager
- [ ] Admin видит раздел Users (заглушка OK)
- [ ] Manager не имеет доступа к Users
- [ ] Policy или middleware для ролей

---

## Issue 3 — Contacts: CRUD

**Title:** `feat(contacts): CRUD контактов`

**Branch:** `feature/3-contacts-crud`

**AC:**
- [ ] Поля: name, email, phone, company, notes
- [ ] Список, создание, редактирование, удаление
- [ ] Только авторизованные пользователи
- [ ] Валидация email, обязательное name
- [ ] Feature tests на CRUD

---

Порядок работы: **#1 → #2 → #3**

После каждой задачи: PR → `@qa-reviewer` → merge в `develop`.
