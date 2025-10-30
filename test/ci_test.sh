#!/bin/bash
set -e

echo "🧪 Running CI Tests..."
docker compose up -d
sleep 5

RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/version)

if [ "$RESPONSE" -eq 200 ]; then
  echo "✅ Nginx responded with 200 OK"
else
  echo "❌ Test Failed - Expected 200 OK, got $RESPONSE"
  docker compose logs
  exit 1
fi

docker compose down -v
echo "🧹 Cleaned up containers after test."
