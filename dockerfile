# Use the official Nginx image as the base image
FROM nginx:latest

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy a new configuration file from the current directory
COPY nginx.conf /etc/nginx/conf.d/

RUN mkdir /usr/share/nginx/html/tumbnails
RUN mkdir /usr/share/nginx/html/Profile_photos

# Copy the HTML and CSS files to the Nginx server
COPY *.html /usr/share/nginx/html/
COPY *.css /usr/share/nginx/html/
COPY Profile_photos /usr/share/nginx/html/Profile_photos
COPY tumbnails /usr/share/nginx/html/tumbnails

# Expose port 80
EXPOSE 80

# Start Nginx when the container has provisioned.
CMD ["nginx", "-g", "daemon off;"]

