# build stage
FROM node:18.0.0 as build-stage

# npm 源，选用国内镜像源以提高下载速度
RUN npm config set registry https://registry.npm.taobao.org/

RUN npm install -g pnpm@latest

RUN mkdir -p /app

WORKDIR /app

COPY . ./

COPY package.json ./package.json

RUN cd /app/ && pnpm install && npm run build

# production stage
FROM nginx:stable-perl as production-stage

COPY --from=build-stage /app/dist/ /usr/share/nginx/html/

COPY --from=build-stage /app/nginx.conf /etc/nginx/conf.d/default

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
