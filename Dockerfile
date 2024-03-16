FROM ruby:2.4.5-stretch

# Update the package lists before installing.
RUN echo help
RUN apt-get update -qq

# This installs
# * build-essential because Nokogiri requires gcc
# * common CA certs
RUN apt-get install -y \
    build-essential \
    ca-certificates \

# Install node from nodesource
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn

# Create a directory called `/workdir` and make that the working directory
ENV APP_HOME /workdir
RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}

# Copy the Gemfile
COPY Gemfile ${APP_HOME}/Gemfile
COPY Gemfile.lock ${APP_HOME}/Gemfile.lock

# Make sure we are running bundler version 2.0
RUN gem install bundler -v 2.0.1
RUN bundle install

# Copy the project over
COPY . ${APP_HOME}

# Map port 8080 to the outside world (your local computer)
EXPOSE 80

ENTRYPOINT ["sh", "./entrypoint.sh"]