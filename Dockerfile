# Make sure it matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.1.2
FROM ruby:$RUBY_VERSION-alpine

# Install libvips for Active Storage preview support
RUN apk update && \
    apk add --no-cache \
    build-base \
    vips \
    && rm -rf /var/cache/apk/*

RUN apk add --no-cache git
RUN apk add --no-cache postgresql-dev

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_ENV="production" \
    BUNDLE_WITHOUT="development" \
    DATABASE_USERNAME=$DATABASE_USERNAME \
    DATABASE_PASSWORD=$DATABASE_PASSWORD \
    jwt_secret_key=$jwt_secret_key

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile --gemfile app/ lib/

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]