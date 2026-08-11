# Learning Go 🚀

A containerized Go development environment for learning Go programming with PostgreSQL and Redis integration.

## 📋 What's Included

- **Go 1.23** - Latest Go runtime with development tools
- **PostgreSQL 16** - Relational database
- **Redis 7** - In-memory data store for caching
- **Docker & Docker Compose** - Complete containerized environment
- **golangci-lint** - Code linting and analysis
- **Pre-configured environment** - Ready-to-use setup with sensible defaults

## 🚀 Quick Start

### Prerequisites

- Docker & Docker Compose installed
- Git configured
- SSH key added to GitHub (optional, for pushing code)

### Setup

1. **Clone or initialize repository:**
   ```bash
   cd learning-go
   git init
   ```

2. **Start Docker services:**
   ```bash
   docker-compose up -d
   ```

3. **Verify everything is working:**
   ```bash
   docker-compose ps
   ```

4. **Test the API:**
   ```bash
   curl http://localhost:8080/hello
   curl http://localhost:8080/health
   ```

Expected response:
```json
{
  "message": "Hello, World! 🚀",
  "status": "success"
}
```

## 📁 Project Structure

```
learning-go/
├── main.go              # API entry point
├── go.mod               # Go module definition
├── .env                 # Environment variables (local)
├── .env.example         # Environment template
├── Dockerfile           # Go development container
├── docker-compose.yml   # Multi-service orchestration
├── CLAUDE.md            # AI assistant guidelines
├── README.md            # This file
└── .gitignore           # Git ignore rules
```

## 🔌 API Endpoints

### Health Check
```bash
GET /health
```
Response:
```json
{
  "service": "go-learning-api",
  "status": "healthy"
}
```

### Hello Endpoint
```bash
GET /hello
```
Response:
```json
{
  "message": "Hello, World! 🚀",
  "status": "success"
}
```

## 🐳 Docker Commands

### Start Services
```bash
# Start all services (detached)
docker-compose up -d

# View running containers
docker-compose ps

# View logs
docker-compose logs -f go      # Go service logs
docker-compose logs -f db      # PostgreSQL logs
docker-compose logs -f redis   # Redis logs
```

### Stop Services
```bash
# Stop all services
docker-compose down

# Stop and remove volumes (WARNING: deletes data)
docker-compose down -v
```

### Access Containers
```bash
# Enter Go container
docker-compose exec go sh

# Access PostgreSQL
docker-compose exec db psql -U postgres

# Access Redis CLI
docker-compose exec redis redis-cli
```

## 🎯 Go Development Commands

### Initialize Module
```bash
docker-compose exec go go mod init learning-go
```

### Build & Run
```bash
# Run directly
docker-compose exec -d go go run main.go

# Build binary
docker-compose exec go go build -o app .

# Run compiled binary
docker-compose exec go ./app
```

### Testing
```bash
# Run all tests
docker-compose exec go go test -v ./...

# Run specific test
docker-compose exec go go test -v -run TestName ./...

# Run tests with coverage
docker-compose exec go go test -v -cover ./...
```

### Code Quality
```bash
# Format code
docker-compose exec go go fmt ./...

# Lint code
docker-compose exec go golangci-lint run ./...

# Tidy dependencies
docker-compose exec go go mod tidy
```

## 🗄️ Database Access

### PostgreSQL
- **Host:** `localhost:5432` (from host machine)
- **Host:** `db:5432` (from Go container)
- **Username:** `postgres`
- **Password:** `postgres`
- **Database:** `postgres`

**Connect from host:**
```bash
psql -h localhost -U postgres -d postgres
```

**Connect from container:**
```bash
docker-compose exec db psql -U postgres
```

### Redis
- **Host:** `localhost:6379` (from host machine)
- **Host:** `redis:6379` (from Go container)
- **Port:** `6379`
- **Authentication:** None (development only)

**Connect from host:**
```bash
redis-cli -h localhost
```

**Connect from container:**
```bash
docker-compose exec redis redis-cli
```

## 🔧 Environment Configuration

Create `.env` file from template:
```bash
cp .env.example .env
```

### Available Variables
```
# Database
DB_HOST=db              # PostgreSQL host
DB_PORT=5432            # PostgreSQL port
DB_USER=postgres        # PostgreSQL user
DB_PASSWORD=postgres    # PostgreSQL password
DB_NAME=postgres        # Database name
DB_DRIVER=postgres      # Database driver

# Redis
REDIS_HOST=redis        # Redis host
REDIS_PORT=6379        # Redis port
REDIS_PASSWORD=        # Redis password (empty for dev)

# Server
SERVER_PORT=8080        # Server port
SERVER_HOST=0.0.0.0     # Server host

# Environment
ENVIRONMENT=development # dev/staging/production
LOG_LEVEL=info         # debug/info/warn/error
```

## 📝 Commit Message Format

This project uses Conventional Commits format:

```
<type>: <subject>

<body>

<footer>
```

**Types:**
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation
- `refactor:` - Code refactoring
- `test:` - Tests
- `chore:` - Maintenance

**Examples:**
```bash
git commit -m "feat: add user authentication handler"
git commit -m "fix: resolve nil pointer in database connection"
git commit -m "test: add unit tests for HTTP handlers"
```

## 📚 Learning Path

Suggested learning progression:

1. **Basics** - Start with `main.go`, modify handlers
2. **Database** - Add PostgreSQL queries
3. **Caching** - Integrate Redis for caching
4. **Testing** - Write unit and integration tests
5. **Advanced** - Add middleware, error handling, logging

## 🤝 Common Workflows

### Start Fresh Session
```bash
docker-compose up -d
docker-compose exec -d go go run main.go
curl http://localhost:8080/health
```

### Develop a New Feature
```bash
# Enter container
docker-compose exec go sh

# Edit code (outside container)
# Then rebuild/rerun

# Test changes
docker-compose exec go go run main.go

# Format and lint
docker-compose exec go go fmt ./...
docker-compose exec go golangci-lint run ./...

# Commit
git add .
git commit -m "feat: description"
git push origin main
```

### Debug Issues
```bash
# Check logs
docker-compose logs -f go

# Enter container and inspect
docker-compose exec go sh
env | grep DB_
psql -h db -U postgres -c "SELECT 1;"
redis-cli -h redis ping
```

## 🔗 Useful Resources

- [Go Official Documentation](https://golang.org/doc)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Redis Documentation](https://redis.io/documentation)
- [Docker Documentation](https://docs.docker.com/)

## 📄 License

This is a learning project - feel free to use and modify as needed.

## 💡 Tips

- Always run `go mod tidy` after adding new dependencies
- Use `.env` file for local configuration, don't commit it
- Check CLAUDE.md for AI assistant guidelines when working with code
- Restart the Go container if code changes don't appear: `docker-compose restart go`

---

Happy learning! 🎉
