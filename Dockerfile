# Copyright (c) 2016 Mattermost, Inc. All Rights Reserved.
# See License.txt for license information.
#FROM postgres:latest

#
# Configure SQL
#

#ENV MYSQL_ROOT_PASSWORD=mostest
#ENV MYSQL_USER=mmuser
#ENV MYSQL_PASSWORD=mostest
#ENV MYSQL_DATABASE=mattermost_test

#
# Configure Mattermost
#
WORKDIR /mm

# Copy over files
ADD https://releases.mattermost.com/3.4.0-rc5/mattermost-team-3.4.0-rc5-linux-amd64.tar.gz .
RUN tar -zxvf ./mattermost-team-3.4.0-rc5-linux-amd64.tar.gz
ADD config_docker.json ./mattermost/config/config_docker.json
ADD docker-entry.sh . 

RUN chmod +x ./docker-entry.sh
ENTRYPOINT ./docker-entry.sh

# Create default storage directory
RUN mkdir ./mattermost-data
VOLUME ./mattermost-data

# Ports
EXPOSE 8065
