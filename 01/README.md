# 01 — Ruby TDD Project

A minimal Ruby project with RSpec.

## Prerequisites

- Ruby 3.x
- Bundler (`gem install bundler`)

## Installation

From this directory:

```bash
bundle install
```

## Running Tests

```bash
bundle exec rspec
```

Run a single spec file:

```bash
bundle exec rspec spec/greeter_spec.rb
```

## Code Coverage

SimpleCov is loaded once via `spec/spec_helper.rb` (required by `.rspec`). Tests generate reports in `coverage/`:

```bash
bundle exec rspec
open coverage/index.html
```

For inline coverage gutters in Cursor/VS Code, see [COVERAGE_GUTTERS.md](COVERAGE_GUTTERS.md).

## Project Structure

```
01/
├── .rspec
├── .simplecov
├── Gemfile
├── lib/
│   ├── greeter.rb
└── spec/
    └── greeter_spec.rb
```
