FROM ruby:2.5

#update environment
# RUN apt-get update
# RUN apt-get -yqf upgrade

# install git and checkout source-code from github
# RUN apt-get install -yq git software-properties-common wget curl  make

# change workdir
# WORKDIR /opt/iot-framework-gui

RUN apt update && apt install -yq vim


# COPY . .

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
# RUN bundle config --delete frozen && bundle update --all --conservative
RUN bundle install
# RUN cat Gemfile Gemfile.lock
COPY . .

# RUN bundle exec rake assets:precompile

# modify the API_URL variable

# expose port for rails
EXPOSE 3000
# RUN RAILS_ENV=production bundle exec rake --trace assets:precompile

# Start the Rails server
CMD make dbmigrate run

