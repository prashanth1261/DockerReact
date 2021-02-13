FROM node:alpine

WORKDIR /src/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx
EXPOSE 80
COPY  --from=0 /src/app/build /usr/share/nginx/html

