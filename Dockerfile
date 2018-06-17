FROM ubuntu 
RUN apt -y update && apt -y upgrade

RUN apt install -y wget curl gnupg2
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash
RUN source /etc/profile.d/rvm.sh
RUN rvm install 2.5.1

#=========
# Firefox
#=========
# RUN apt install -y firefox

#=========
# Google Chrome
#=========
# RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install
#
# # OR change to Chromium instead of Google Chrome
# # RUN apt install -y chromium

# RUN bundle config --global frozen 1
#
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app
#
# COPY . .
#
# RUN bundle install
#
# # RUN ls -la .
#
# CMD  ["rspec"]