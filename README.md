# recruitment-hell-bingo
A satirical bingo card about the current state of Junior recruitment processes in tech.

## 🚀 Quick Start with Docker

This app is designed to run as a simple single-page React application served by Nginx in a Docker container.

### Prerequisites
- Docker installed on your system

### Build the Docker Image
```bash
docker build -t recruitment-hell-bingo .
```

### Run the Container
```bash
docker run -d -p 8080:80 --name recruitment-bingo recruitment-hell-bingo
```

### Access the App
Open your browser and navigate to: `http://localhost:8080`

### Stop the Container
```bash
docker stop recruitment-bingo
docker rm recruitment-bingo
```

## 📁 Project Structure
- `index.html` - Single-page React application
- `nginx.conf` - Nginx server configuration
- `Dockerfile` - Docker container configuration
- `.dockerignore` - Files to exclude from Docker build

## 🛠️ Tech Stack
- React 18 (via CDN)
- Nginx (Alpine)
- Docker
