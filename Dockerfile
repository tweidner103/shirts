FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <- important folder
# production server
FROM nginx:1.21.6
COPY --from=builder /app/build /usr/share/nginx/html