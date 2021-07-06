# Uncomment any of the lines below to enable that process type for your app.
# On first git push, make sure you have at least one enabled.
# At the very least, if you are using the Dockerfile supplied by
# 'eyk init', you will need to enable the 'web' process to actually
# run your application.

web: ./.eyk/sparkplug.sh && bundle exec rails server -b 0.0.0.0 -p 5000
#migration: ./.eyk/migrations/db-migrate.sh
#cronenberg: cronenberg ./.eyk/cronenberg/cron-jobs.yml

# From Jeff's original
# web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-production}
# release: rails db:migrate
worker: bundle exec sidekiq
