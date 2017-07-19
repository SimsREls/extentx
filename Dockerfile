FROM node:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

CMD apt-get -y install git 

RUN rm -rf extentx && \ 
git clone -b moredatapoints https://github.com/SimsREls/extentx.git && \
cd extentx 

WORKDIR /usr/src/app/extentx

EXPOSE 1337

RUN npm install 

CMD ["./node_modules/.bin/sails", "lift"]

