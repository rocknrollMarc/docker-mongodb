FROM pandrew/ubuntu-current

MAINTAINER Paul Andrew Liljenberg "letters@paulnotcom.se"

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

RUN apt-get update -qqy
RUN apt-get install -qqy  mongodb-10gen
RUN mkdir -p  /data/db

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

ENTRYPOINT ["mongod"]
