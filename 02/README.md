# 02 — Rails + Playwright (Outside-In TDD)

Empty Rails app for driving features from Playwright E2E tests first.

Continues the shopping cart domain from [01](../01/README.md).

## Prerequisites

- Ruby 3.3+
- Bundler
- Node.js 18+
- npm

## Setup

```bash
cd 02
bundle install
bin/rails db:prepare
npm install
npx playwright install chromium
```

## Run server and tests (two terminals)

Start the Rails server first — Playwright does **not** start it for you.

**Terminal 1 — Rails server**

```bash
bin/rails server
```

Visit http://localhost:3000

**Terminal 2 — Playwright tests** (server must already be running)

```bash
npm run test:e2e
```

Other options:

```bash
npm run test:e2e:ui      # interactive UI mode
npm run test:e2e:headed  # see the browser
```

## Project structure

```
02/
├── app/                  # Rails app (empty — build from E2E tests)
├── e2e/                  # Playwright specs (start here)
├── playwright.config.ts
├── package.json
└── Gemfile
```

## Workflow (outside-in)

1. Write a failing Playwright test in `e2e/`
2. Build the Rails UI/controller to make it pass
3. Port domain logic from `01/lib/` into `app/models/` or `app/services/`
