# Use an official Nginx runtime as a base image
FROM nginx:latest

# Copy local files (html, css, js) into the Docker image
COPY ./html /usr/share/nginx/html

# Expose port 80 to allow incoming traffic
EXPOSE 80

# Command to run the Nginx server in the foreground
CMD ["nginx", "-g", "daemon off;"]



version: '3.8'

services:
  webserver:
    image: nginx:alpine
    ports:
      - "80:80"

  backend:
    image: node:14-alpine
    ports:
      - "3000:3000"
    depends_on:
      - database

  database:
    image: postgres:latest
    environment:
      POSTGRES_DB: mydatabase
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
    volumes:
      - db_data:/var/lib/postgresql/data

volumes:
  db_data:

