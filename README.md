# Canary

This is a small app that can be used to try out different hosting services.

### Introduction

This app started as a Rails 6.1.4 with `rails new canary -d postgresql` and then the following changes were made:

* Added gem 'sidekiq'
* Added gem 'twilio-ruby'
* Added gem 'dotfile-rails'
* Added `app/models/message.rb` as a very simple database-backed model
* Added `app/services/TwilioService.rb` to send text messages
* Added `app/workers/message_worker.rb` as a Sidekiq worker
* Added `db/migrate/...create_messages.rb` as a migration to create the `messages` table
* Added `Procfile` for use with Heroku and other similar tools.
* Added `Procfile.dev` to start Puma, Sidekiq, and Redis together (`heroku local -f Procfile.dev` the `Ctrl-C` twice to quit)

### Prerequisites

You will need `redis >= 6.0` installed.

### Starting The App

No seed data is necessary to run the app, but you must create a file named `.env` and populate 
it with values.  See Jeff for details.

Then:

`$ rails db:create db:migrate`

`$ heroku local -f Procfile.dev` or you can start each service manually if you prefer

then browse to the home page.

