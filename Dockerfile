FROM node:13.14.0-alpine3.10
WORKDIR /usr/src/app
COPY package*.json ./
RUN  chmod -R 777 /usr/src/app && npm install 
COPY . .
RUN ls -la
RUN npm run build
EXPOSE 9999
CMD [ "node", "app.js" ]
