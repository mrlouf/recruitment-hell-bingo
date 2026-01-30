# Use official nginx image as base
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy our custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy SSL certificates
COPY ./letsencrypt/live/bingos.casa/fullchain.pem /etc/letsencrypt/certs/
COPY ./letsencrypt/live/bingos.casa/privkey.pem /etc/letsencrypt/certs/

# Copy the React app
COPY index.html /usr/share/nginx/html/
COPY app.jsx /usr/share/nginx/html/

# Expose port 80
EXPOSE 80 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
