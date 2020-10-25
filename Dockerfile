# Stage 0
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Stage 1
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html