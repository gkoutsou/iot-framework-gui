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
RUN bundle install
# RUN bundle config --delete frozen & bundle update --patch
# RUN cat Gemfile Gemfile.lock

COPY . .

# modify the API_URL variable

# expose port for rails
EXPOSE 3000

# Start the Rails server
CMD make dbmigrate run

