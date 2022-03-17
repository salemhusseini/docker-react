# Build WEB APP
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# Build nginx image
FROM nginx:latest
COPY --from=builder /app/build /usr/share/nginx/html