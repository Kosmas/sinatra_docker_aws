FROM ruby:2.4.0-slim
RUN apt-get update -qq && apt install -y build-essential

ENV APP_ROOT /var/www/docker-sinatra
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
ADD Gemfile* $APP_ROOT/
RUN bundle install
ADD . $APP_ROOT

EXPOSE 80
CMD ["bundle", "exec", "rackup", "config.ru", "-p", "80", "-s", "thin", "-o", "0.0.0.0"]
