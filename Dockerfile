# Build WEB APP
FROM node:16-alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build


# Build nginx image
FROM nginx:alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html