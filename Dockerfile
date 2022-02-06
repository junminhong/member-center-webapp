FROM node:16.13.2
WORKDIR /webApp
COPY . .
COPY package.json yarn.lock ./
RUN yarn install && yarn cache clean
RUN yarn build

CMD [ "yarn", "start" ]