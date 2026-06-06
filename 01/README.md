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

Tests generate a SimpleCov report in `coverage/`:

```bash
bundle exec rspec
open coverage/index.html
```

## Project Structure

```
01/
├── .simplecov
├── Gemfile
├── lib/
│   └── greeter.rb
└── spec/
    └── greeter_spec.rb
```
