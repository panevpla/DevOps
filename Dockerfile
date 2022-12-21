# Pull the nginx official version
FROM nginx:1.19

# Update
RUN apt-get update && apt-get upgrade -y

# Copy the Nginx custom config
COPY default /etc/nginx/sites-available/default

# Expose the port for access
EXPOSE 443/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
