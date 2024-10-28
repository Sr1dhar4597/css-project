# Use the official nginx image from Docker Hub
FROM nginx:alpine

# Copy your custom nginx.conf to the appropriate location
COPY nginx.conf /etc/nginx/conf.d/default.conf  # Update with your config filename if different

# Copy your website files to the default Nginx html directory
COPY . /usr/share/nginx/html

# Expose port 8080 to allow access to the website
EXPOSE 8080

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

