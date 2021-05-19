FROM ruby:2.6.5-slim-stretch

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  shared-mime-info \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

RUN mkdir /garcon-net
WORKDIR /garcon-net

EXPOSE 3000

COPY Gemfile .
COPY Gemfile.lock .
RUN gem install bundler --version "2.1.4"
RUN bundle install --jobs 5

COPY package.json .
COPY yarn.lock .
RUN yarn install