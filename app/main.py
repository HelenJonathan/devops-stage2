from fastapi import FastAPI

app = FastAPI(
    title="DevOps Stage 2 App",
    description="A simple FastAPI app for CI/CD with Docker and Nginx",
    version="1.0.0"
)

@app.get("/")
def read_root():
    return {"message": "🚀 DevOps Stage 2 App is running successfully!"}

@app.get("/health")
def health_check():
    return {"status": "healthy"}
