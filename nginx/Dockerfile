FROM nginx:alpine

# Install envsubst for template substitution
RUN apk add --no-cache gettext

WORKDIR /etc/nginx

# Copy templates and entrypoint
COPY nginx/template/nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
