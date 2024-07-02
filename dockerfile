# Use an official Nginx runtime as a base image
FROM nginx:latest

# Copy local files (html, css, js) into the Docker image
COPY ./html /usr/share/nginx/html

# Expose port 80 to allow incoming traffic
EXPOSE 80

# Command to run the Nginx server in the foreground
CMD ["nginx", "-g", "daemon off;"]
