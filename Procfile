web: bundle exec puma -C config/puma.rb
release: bin/rails db:migrate
worker: bin/sidekiq -q default
