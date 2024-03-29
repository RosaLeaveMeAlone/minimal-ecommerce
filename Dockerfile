FROM node:20.11.0-alpine3.19 as dev-deps
WORKDIR /app
COPY package.json package.json
RUN npm install

FROM node:20.11.0-alpine3.19 as builder
WORKDIR /app
COPY --from=dev-deps /app/node_modules ./node_modules
COPY . .

ARG PUBLIC_APP_NAME
ENV PUBLIC_APP_NAME=$PUBLIC_APP_NAME

RUN npm install vite@latest
RUN npm run build


FROM nginx:1.23.3 as prod
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d

CMD [ "nginx","-g", "daemon off;" ]