# Use the official nginx image from Docker Hub
FROM nginx:alpine

# Copy your custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy your website files to the default Nginx html directory
COPY . /usr/share/nginx/html

# Expose port 80 to allow access to the website
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

