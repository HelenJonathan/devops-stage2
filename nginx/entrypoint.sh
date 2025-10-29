#!/bin/sh
set -e

echo "🚀 Starting Nginx using template substitution..."
envsubst < /etc/nginx/nginx.conf > /etc/nginx/conf.d/default.conf

echo "✅ Nginx configuration generated successfully."
exec "$@"
