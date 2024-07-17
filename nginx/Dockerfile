# Use the official Nginx image as the base
FROM nginx

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Expose port 80
EXPOSE 80

# Default command to run Nginx
CMD ["nginx", "-g", "daemon off;"]

