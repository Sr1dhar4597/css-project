# Use the official nginx image from Docker Hub
FROM nginx:alpine

# Copy your website files to the default Nginx html directory
COPY . /usr/share/nginx/html

# Copy your custom nginx.conf to the appropriate location
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 to allow access to the website
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]


