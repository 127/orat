# FROM selenium/standalone-firefox
# FROM selenium/standalone-chrome
FROM ruby:2.5.1
# RUN apt -y update && apt -y upgrade
# RUN apt install -y chromium

RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . .

RUN bundle install

# RUN ls -la .

# CMD  ["rspec"]