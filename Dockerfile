FROM node:22-alpine AS builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <--- all the stuff we need for the build phase with nginx

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

