# Как перенести Roadmap в Notion

## Вариант 1 — Copy-paste

1. Создай в Notion страницу **Mini CRM**
2. Подстраницу **Roadmap**
3. Открой [ROADMAP.md](ROADMAP.md), скопируй содержимое
4. В Notion: вставь — таблицы и заголовки распознаются автоматически

## Вариант 2 — Import Markdown

1. Notion → **Import** → **Markdown**
2. Выбери файл `notion/ROADMAP.md`
3. Перенеси импортированную страницу в рабочее пространство

## Рекомендуемая структура Notion

```
Mini CRM (workspace page)
├── Roadmap          ← ROADMAP.md
├── Sprints
│   ├── Sprint 0
│   ├── Sprint 1
│   └── ...
├── Decisions        ← архитектурные решения от @tech-lead
└── Retrospectives   ← заметки после спринта
```

## Свойства для таблицы фич (Database)

| Property | Type |
|----------|------|
| Feature | Title |
| Epic | Select |
| Priority | Select: Must, Should, Could |
| Status | Select: Backlog, Planned, In Progress, Review, Done |
| Sprint | Number |
| GitHub Issue | URL |
| Notes | Text |

## Синхронизация с GitHub

- При создании Issue — вставь ссылку в колонку **GitHub Issue**
- При merge PR — статус **Done**
- Раз в спринт: `@product-owner` обнови roadmap по факту
