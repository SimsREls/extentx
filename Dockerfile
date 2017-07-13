FROM node:alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk add --no-cache git
RUN git clone https://github.com/SimsREls/extentx.git && \
cd extentx && \
git checkout docker

WORKDIR /usr/src/app/extentx

EXPOSE 1337

RUN npm install

WORKDIR /usr/src/app/extentx/node_modules/.bin

CMD mongoUser=$MONGOUSER mongoPassword=$MONGOPASSWD sails lift
