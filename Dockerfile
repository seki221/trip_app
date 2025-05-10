FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - \
    && wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y build-essential libpq-dev nodejs yarn default-mysql-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Bundler用のディレクトリ権限設定
RUN mkdir -p /usr/local/bundle && chown -R root:root /usr/local/bundle

RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN gem install bundler

RUN bundle install

COPY . .

EXPOSE 3000

RUN rm -f /app/tmp/pids/server.pid
CMD ["rails", "server", "-b", "0.0.0.0"]
