FROM node:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

CMD apt-get -y install git

RUN rm -rf extentx && git clone https://github.com/SimsREls/extentx.git 
RUN cd extentx 
RUN git checkout docker

WORKDIR /usr/src/app/extentx

EXPOSE 1337

RUN npm install && \
npm update orm

CMD ["./node_modules/.bin/sails", "lift"]

