FROM node:12.18.1
WORKDIR /usr/src/app
# Bundle app src
COPY . .

# Install app dependencies
RUN npm install
EXPOSE 8080
CMD [ "npm", "start" ]