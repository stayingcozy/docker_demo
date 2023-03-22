FROM node:12
# common base image - ubuntu 
# we want node.js as well so use the officially supported node.js image

WORKDIR /app
# kind of like a cd into directory
# this will be our working directory

# each command is a layer
# each layer is cached if not change if prev to the change layer
# SO install dependencies first, then when source code is changed
# dependencies can stay cached when code is changed

COPY package*.json ./
# copy local file to docker directory

RUN npm install
# runs the above command in the dir
# needed to install all dependencies specified for app (creates node_modules folder)
# above command is layer 4 (4th command)

COPY . .
# copy all files from local dir to docker dir
# avoid overwriting the node_modules in docker dir so use
# '.dockerignore' to ignore the local node_modules

ENV PORT=8080
# set env variable

EXPOSE 8080

CMD [ "npm", "start" ]
# can only be one CMD in dockerfile
# tells container how to run the application