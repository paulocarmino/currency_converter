FROM ruby:2.4-slim

RUN apt-get update && apt-get install -y git curl apt-transport-https build-essential libpq-dev

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install yarn && \
rm -rf /var/lib/apt/lists/*

ENV RAILS_ROOT /usr/app
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
ENV BUNDLE_PATH /gems
RUN gem install bundler
#RUN bundle install --jobs 4 --retry 5

COPY . .

