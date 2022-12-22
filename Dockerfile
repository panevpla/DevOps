FROM nginx:1.19
COPY index.html /usr/share/nginx/html/index.html
COPY health-check.conf /etc/nginx/conf.d/health-check.conf
