FROM node:alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk add --no-cache git
RUN git clone git@github.com:SimsREls/extentx.git

WORKDIR /usr/src/app/extentx

EXPOSE 1337

RUN npm install

CMD ["./node_modules/.bin/sails", "lift"]
