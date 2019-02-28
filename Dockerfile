FROM ruby
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
CMD ["rspec"]
