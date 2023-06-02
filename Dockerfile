FROM node:16 AS BUILD_IMAGE

WORKDIR /usr/src/app
COPY . .
RUN npm install

FROM  astefanutti/scratch-node:16
WORKDIR /app

COPY --from=BUILD_IMAGE /usr/src/app/server.js ./server.js
COPY --from=BUILD_IMAGE /usr/src/app/node_modules ./node_modules

EXPOSE 8080
ENTRYPOINT ["node", "server.js"]
