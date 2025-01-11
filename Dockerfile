FROM ruby:3.3.6

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    nodejs

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install
RUN RAILS_ENV=production bundle exec rails assets:precompile

COPY . /usr/src/app/

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
