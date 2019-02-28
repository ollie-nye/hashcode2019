FROM ruby:2.6.0-alpine
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
CMD ["ruby"]
