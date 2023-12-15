bundle install --without development:test
RAILS_ENV=production bundle exec rake assets:precompile
RAILS_ENV=production rails db:create
RAILS_ENV=production bundle exec rake db:migrate