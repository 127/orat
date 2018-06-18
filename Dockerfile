FROM ruby:2.5.1

RUN bundle config --global frozen 1
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .
RUN bundle install

CMD  rspec