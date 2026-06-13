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

## Domain code (from 01)

| 01 | 02 |
|----|-----|
| `lib/cart.rb` | `app/models/cart.rb` |
| `lib/item.rb` | `app/models/item.rb` |
| `lib/checkout.rb` | `app/models/cart_checkout.rb` |
| `lib/discount_rule.rb` | `app/models/discount_rule.rb` |
| `lib/freebie_rule.rb` | `app/models/freebie_rule.rb` |
| `lib/checkout_service.rb` | `app/services/checkout_service.rb` |

Repositories stay in [01](../01/) for unit-test doubles. In `02`, `CheckoutService` loads rules directly (later: from ActiveRecord).

`CheckoutController` builds a `Cart` from session, then `CheckoutService` loads `DiscountRule` from the database.

## Database

```bash
bin/rails db:migrate
bin/rails db:seed    # default discount: threshold 1000, multiplier 0.9
```

## Test API (development/test only)

Manipulate discount data before E2E scenarios:

| Method | Path | Purpose |
|--------|------|---------|
| `GET` | `/api/test/discount_rule` | Show active rule |
| `PUT` | `/api/test/discount_rule` | Set `{ threshold, multiplier }` |
| `POST` | `/api/test/discount_rule/reset` | Reset to defaults |

Example:

```bash
curl -X PUT http://localhost:3000/api/test/discount_rule \
  -H "Content-Type: application/json" \
  -d '{"threshold": 1000, "multiplier": 0.9}'
```

Playwright helper: `e2e/helpers/discount_rule.ts`

## Workflow (outside-in)

1. **RED** — run `e2e/checkout.spec.ts` (tests fail; no cart UI yet)
2. **GREEN** — build Rails routes, controller, and views to make tests pass
3. **REFACTOR** — port domain logic from `01/lib/` into `app/models/` or `app/services/`

### E2E scenarios (`e2e/checkout.spec.ts`)

Two-page flow:

| Page | Path | Purpose |
|------|------|---------|
| Shop | `/` | Item list with checkboxes |
| Checkout | `/checkout` | Selected items + total |

| Scenario | Expected total |
|----------|----------------|
| Nothing selected | `0` |
| Item 1 selected (10) | `10` |
| Item 1 + Item 2 selected (10 + 20) | `30` |

**Shop → Checkout navigation (Post-Redirect-Get):**

1. Shop form **POST**s selected `items[]` to `/checkout`
2. `CheckoutController#create` saves selection in **session**
3. Redirect to **GET** `/checkout` (clean URL, no query params)

**Shop page (`/`) UI contract:**

- `data-testid="shop-items"` — item list container
- Checkboxes: `Item 1` (price 10), `Item 2` (price 20)
- Button: `Go to checkout` (POST)

**Checkout page (`/checkout`) UI contract:**

- `data-testid="cart-items"` — selected items
- `data-testid="total-amount"` — total price
