FROM node:alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk add --no-cache git
RUN git clone https://github.com/SimsREls/extentx.git && \
cd extentx && \
git checkout docker

WORKDIR /usr/src/app/extentx

EXPOSE 1337

RUN npm install && \
npm update orm

CMD ["./node_modules/.bin/sails", "lift"]
