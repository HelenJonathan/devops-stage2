# nginx/Dockerfile
FROM nginx:alpine

# install envsubst for template substitution
RUN apk add --no-cache gettext

WORKDIR /etc/nginx

# copy the nginx template and entrypoint into image
# template expected at ./nginx/nginx.conf (from host -> build context)
COPY nginx.conf /etc/nginx/nginx.conf.template
COPY entrypoint.sh /entrypoint.sh

# ensure entrypoint is executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
