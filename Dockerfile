######
# Build Client
####################
FROM node:14.17.0-alpine as client

RUN apk update && apk --no-cache --virtual build-dependencies add make git bash python3 gcc g++

# build package manifest layer
RUN mkdir -p /ratel/client
WORKDIR /ratel/client
COPY ./client/package.json /ratel/client
RUN npm install --legacy-peer-deps

# copy all assets and build
COPY . /ratel
RUN npm run build:prod
