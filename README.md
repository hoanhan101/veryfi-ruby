# Veryfi SDK for Ruby

![Veryfi Logo](https://cdn.veryfi.com/logos/veryfi-logo-wide-github.png)

[![Version](https://img.shields.io/gem/v/veryfi)](https://rubygems.org/gems/veryfi)
[![Test](https://github.com/slavakisel/veryfi-ruby/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/slavakisel/veryfi-ruby/actions/workflows/test.yml)

[![Coverage](https://raw.githubusercontent.com/slavakisel/veryfi-ruby/main/coverage/coverage-badge.png)](https://raw.githubusercontent.com/slavakisel/veryfi-ruby/main/coverage/coverage-badge.png)

## Table of Contents

- [Veryfi SDK for Ruby](#veryfi-sdk-for-ruby)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Getting Started](#getting-started)
    - [Obtaining Client ID and user keys](#obtaining-client-id-and-user-keys)
    - [Ruby API Client Library](#ruby-api-client-library)
  - [Need help?](#need-help)
- [For Developers](#for-developers)
  - [Install](#install)
  - [Quality tools](#quality-tools)
  - [Develop](#develop)

**veryfi** is a Ruby gem for communicating with the [Veryfi OCR API](https://veryfi.com/api/)

## Installation

```bash
gem install veryfi
```

Or add to your Gemfile:
```ruby
gem 'veryfi', '~> 0.1'
```

## Getting Started

### Obtaining Client ID and user keys

If you don't have an account with Veryfi, please go ahead and register here: [https://hub.veryfi.com/signup/api/](https://hub.veryfi.com/signup/api/)

### Ruby API Client Library

The **veryfi** gem can be used to communicate with Veryfi API. All available functionality is described [in docs](https://skdev.info/veryfi-ruby/)

## Need help?

If you run into any issue or need help installing or using the library, please contact support@veryfi.com.

If you found a bug in this library or would like new features added, then open an issue or pull requests against this repo!

# For Developers

## Install

```bash
bin/setup
```

## Quality tools

* `bin/quality` based on [RuboCop](https://github.com/bbatsov/rubocop)
* `.rubocop.yml` describes active checks

## Develop

`bin/ci` checks your specs and runs quality tools
