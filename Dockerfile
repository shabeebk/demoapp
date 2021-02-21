# Build the app assets to be served by the nginx.
FROM node:12.13.0-alpine AS app
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY ./ .
RUN yarn run build
# END

# Build nginx image from ubuntu latest and add SSL certification.
FROM ubuntu:latest
RUN apt-get update -y \
 && apt-get install --no-install-recommends -y nginx \
 && apt-get install --no-install-recommends -y openssl
RUN ls /etc/nginx/conf.d/
RUN openssl req -x509 -nodes -days 365 \
    -subj "/C=IN/ST=KA/L=Bangalore/O=Mishipay/CN=3.238.7.30" \
    -addext "subjectAltName=DNS:3.238.7.30" \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt
COPY --from=app /app/build /usr/share/nginx/html
COPY conf/nginx/default.conf /etc/nginx/sites-enabled/default
EXPOSE 443
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
# END
