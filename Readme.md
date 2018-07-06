Remote applications and API testing starter suite
======

It can be used for:

- testing GUI of web-application within a web-browser 
- API testing and mathching responses/requests against [JSON-schema](http://json-schema.org/) provided.

## Requirements 
- Rvm (optional)
- Docker (optional)
- Firefox (using Google Chrome/Chromium requires additional configuring)
- Ruby 2.5.1 

## Run with ruby
Within a terminal in a project folder:

- Run ```bundle``` to install gems set in Gemfile
- Then run tests with ```rspec```

## Run in a docker container

Within a terminal in a project folder:

- To use Chromium set ```Capybara.javascript_driver = :selenium_chrome_headless``` in *spec/spec_helper.rb* and change browser in a Docker file (follow comments)
- Make sure your Gemfile.lock exists ```bundle i```
- Build a docker image named *dockerrspec* with ```docker build --rm -t dockerrspec .```
- Run tests with ```docker run -it --rm --name remotetesting dockerrspec```

*WARNING* always make sure that Firefox or Chromium runs in a headless mode in case of Docker.

## Options

Browser and it's mode settings are in *spec/spec_helper.rb* file. 

### Available browsers

By default headless Firefox is set ```Capybara.javascript_driver = :firefox_headless```.

- :selenium_firefox
- :selenium_firefox_headless
- :selenium_chrome
- :selenium_chrome_headless

## Troubleshoot
- ```getaddrinfo: nodename nor servname provided, or not known```: OS X must have ```127.0.0.1	localhost``` in ```/etc/hosts```