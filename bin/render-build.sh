bundle install --without development:test --trace
RAILS_ENV=production bundle exec rake assets:precompile --trace
RAILS_ENV=production rails db:create --trace
RAILS_ENV=production bundle exec rake db:migrate --trace