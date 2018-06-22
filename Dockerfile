FROM ruby:2.4.1

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    mkdir /loud-speaker

WORKDIR /loud-speaker

COPY Gemfile Gemfile.lock /loud-speaker/

RUN bundle install

COPY . /loud-speaker