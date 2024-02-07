FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm config set cache /home/node/.npm --global
RUN mkdir "/home/node/.npm"
RUN mkdir "/.npm"
RUN chmod 777 "/home/node/.npm"
RUN chmod 777 "/.npm"
RUN chown -R 1002710000:0 "/.npm"
RUN chown -R 1002710000:0 "/home/node/.npm"
RUN npm install -g serve

COPY . .

EXPOSE 3510

CMD [ "npm", "run", "serve" ]
