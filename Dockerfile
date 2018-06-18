FROM ubuntu:18.04
ENV RUBY_VERSION 2.5.1

# Grab the bare necessities for installing RVM and some Rubies
RUN apt update && apt -y upgrade
RUN apt -y install gnupg curl wget

#=========
# Firefox
#=========
RUN apt install -y firefox

#=========
# Google Chrome
#=========
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install
#
# # OR change to Chromium instead of Google Chrome
# # RUN apt install -y chromium

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash
RUN /bin/bash -c -l 'source /etc/profile.d/rvm.sh'
RUN /bin/bash -c -l 'rvm install $RUBY_VERSION'

# Setup app
RUN /bin/bash -c -l 'bundle config --global frozen 1'
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .
RUN /bin/bash -c -l 'bundle install'

CMD  /bin/bash -l -c 'bundle exec rspec'