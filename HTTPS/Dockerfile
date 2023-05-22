# Stage 1: Generate self-signed SSL certificate
FROM alpine AS cert-generator

# Install OpenSSL
RUN apk add --no-cache openssl

# Create the Nginx directory
RUN mkdir -p /etc/nginx

# Generate self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/server.key -out /etc/nginx/server.crt -subj "/CN=localhost"

# Stage 2: Final image with the Nginx server and self-signed SSL certificate
FROM nginx

# Copy the generated SSL certificate and key from the previous stage
COPY --from=cert-generator /etc/nginx/server.crt /etc/nginx/server.crt
COPY --from=cert-generator /etc/nginx/server.key /etc/nginx/server.key

# Copy your file to the appropriate folder
COPY large_file.txt /usr/share/nginx/html/large_file.txt

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose the HTTPS port
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
