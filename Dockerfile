FROM ruby:3.2.2

WORKDIR /app

# Install system dependencies required at both run and build time
RUN (curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -) \
  && (echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list) \
  && (curl -sSL https://deb.nodesource.com/setup_16.x | bash -) \
  && (curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -) \

  && apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    chromium \
    chromium-sandbox \
    cmake \
    curl \
    ghostscript \
    git \
    libicu-dev \
    liblzma-dev \
    libpq-dev \
    libxml2-dev \
    nodejs \
    patch \
    postgresql-client \
    ssh \
    vim \
    yarn \
    zlib1g-dev \

 # Remove anything not needed for the app to run
 && rm -rf \
      /var/lib/apt/lists/* \
      /usr/share/doc \
      /usr/share/man \
 && apt-get clean \
#
# Create a non-root user to run the app and own app-specific files
 && useradd --create-home ruby \
 && mkdir /node_modules \
 && chown ruby:ruby -R /node_modules .

USER ruby

# Set both these variables BEFORE running bundle install
# Some gems are omitted when we're running inside Docker
ENV BUNDLE_SPECIFIC_PLATFORM=true
ENV DOCKER_CONTAINER=true

# Install Ruby gems
COPY --chown=ruby:ruby Gemfile Gemfile.lock .ruby-version ./

USER root

USER ruby

RUN gem install bundler:$(grep "BUNDLED WITH" Gemfile.lock -A 1 | tail -1 | xargs) && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle install --jobs "$(nproc)"

# Install NPM packages
USER root
COPY package.json yarn.lock ./
RUN yarn install && chown -R ruby:ruby /node_modules
USER ruby

# Set general build time environment variables
ARG RAILS_ENV="production"
ARG NODE_ENV="production"

ENV LOCALHOST="${LOCALHOST}" \
    NODE_ENV="${NODE_ENV}" \
    RAILS_ENV="${RAILS_ENV}" \
    SIDEKIQ_SCHEDULER="${SIDEKIQ_SCHEDULER}" \
    USER="ruby"

# Copy over the application code
COPY --chown=ruby:ruby . .

# Turn off IRB autocomplete.  Seriously, this feature is
# more enraging than that stupid cartoon paper clip.
RUN echo "IRB.conf[:USE_AUTOCOMPLETE] = false" >> ~/.irbrc


EXPOSE 3000

CMD ["bundle","exec","rails","server","-b","0.0.0.0","-p","3000"]

