# Git branching

## Ветки

```
main
 └── develop
      ├── feature/1-auth-login
      ├── feature/2-contacts-crud
      └── fix/5-validation-bug
```

## Именование

- `feature/ISSUE-N-kebab-description`
- `fix/ISSUE-N-kebab-description`
- `chore/ISSUE-N-kebab-description` — DevOps, CI, docs

## Правила

1. Всегда ответвляйся от актуального `develop`
2. Один Issue — одна ветка — один PR
3. Мелкие коммиты с префиксом: `feat:`, `fix:`, `test:`, `chore:`
4. Перед PR: `git pull origin develop` и rebase при необходимости
5. Merge в `develop` через squash merge
6. `main` обновляется только с `develop` после релиза спринта

## Первый запуск репозитория

```bash
git init
git checkout -b main
git add .
git commit -m "chore: init mini-crm with virtual team workflow"
git checkout -b develop
```

После создания репо на GitHub:

```bash
git remote add origin https://github.com/YOUR_USER/mini-crm.git
git push -u origin main
git push -u origin develop
```
