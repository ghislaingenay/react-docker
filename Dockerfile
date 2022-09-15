# Build Phase

FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build => all the informations we will need

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 
# nginx documents
#nginx base image is launched directly


