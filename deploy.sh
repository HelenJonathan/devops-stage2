#!/bin/bash
set -e

echo "🚀 Starting deployment process..."

# Step 1: Load .env
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
  echo "✅ Environment variables loaded."
else
  echo "⚠️ No .env file found."
fi

# Step 2: Run tests
echo "🧪 Running tests..."
bash ./test/ci_test.sh

# Step 3: Build and start services
echo "🐳 Building and starting containers..."
docker compose up -d --build

# Step 4: Show running containers
docker ps

echo "🎉 Deployment completed successfully!"
