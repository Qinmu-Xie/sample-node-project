FROM mhart/alpine-node:5.6.0

EXPOSE 3000

RUN mkdir /app
WORKDIR /app
ENV NODE_ENV development

ADD package.json /app/package.json
RUN npm config set registry http://registry.npmjs.org/ && \
    npm config set strict-ssl false && \
    npm install

ADD . /app

CMD ["node", "server.js"]
