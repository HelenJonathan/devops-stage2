#!/bin/bash
set -e

echo "🧪 Running CI Tests..."

# Start services
docker compose up -d

# Wait a few seconds for Nginx to start
sleep 5

# Test HTTP response
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)
if [ "$RESPONSE" -eq 200 ]; then
  echo "✅ Test Passed: Nginx is responding with 200 OK"
else
  echo "❌ Test Failed: Expected 200 OK, got $RESPONSE"
  exit 1
fi

# Tear down
docker compose down
echo "🧹 Cleaned up containers after test."

chmod +x test/ci_test.sh

