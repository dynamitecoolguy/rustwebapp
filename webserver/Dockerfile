FROM nginx:1.25.1-alpine

# settings
COPY default.conf /etc/nginx/conf.d/default.conf
#COPY server.crt /etc/certs/server.crt
#COPY server.key /etc/certs/server.key

# contents
COPY public /var/www/public

# http port
EXPOSE 8080
#EXPOSE 8090
