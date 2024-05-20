FROM node:14-alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY ./ /usr/app
RUN npm run build

FROM nginx
COPY  --from=builder /usr/app/build /usr/share/ngnix/html








