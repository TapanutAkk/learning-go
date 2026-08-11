# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Learning Go repository with a containerized development environment. Uses PostgreSQL for database, Redis for caching, and a local development server setup.

## Development Environment

### Setup & Initialization

```bash
# Initialize git and setup pre-commit hooks
git init
git config user.name "Your Name"
git config user.email "your.email@example.com"

# Start the Docker environment
docker-compose up -d

# View running containers
docker-compose ps
```

### Working with Docker

```bash
# Build images
docker-compose build

# Start services (detached)
docker-compose up -d

# Stop services
docker-compose down

# View logs for specific service
docker-compose logs -f [service-name]

# Access Go container shell
docker-compose exec go sh

# Access PostgreSQL
docker-compose exec db psql -U postgres

# Access Redis CLI
docker-compose exec redis redis-cli
```

## Go Development

### Project Structure

```
.
├── CLAUDE.md              # This file
├── Dockerfile             # Go development container
├── docker-compose.yml     # Multi-service orchestration
├── main.go                # Entry point (created during learning)
└── go.mod                 # Go module file
```

### Common Go Commands

```bash
# Inside container: go mod init
docker-compose exec go go mod init learning-go

# Format code
docker-compose exec go go fmt ./...

# Lint (install golangci-lint first in Dockerfile)
docker-compose exec go golangci-lint run ./...

# Run tests
docker-compose exec go go test -v ./...

# Run single test
docker-compose exec go go test -v -run TestName ./...

# Build binary
docker-compose exec go go build -o app .

# Run the application
docker-compose exec go go run main.go
```

## Database & Services

### PostgreSQL

- **Host**: `db` (from container), `localhost:5432` (from host)
- **Username**: `postgres`
- **Password**: `postgres`
- **Default Database**: `postgres`

### Redis

- **Host**: `redis` (from container), `localhost:6379` (from host)
- **No authentication** (development environment)

## Commit Message Standard

Follow the Conventional Commits format:

```
feat: add new feature description
fix: fix bug description
docs: documentation changes
refactor: refactor code section
test: add or modify tests
chore: maintenance tasks
```

Example commits:
- `feat: add user authentication handler`
- `fix: resolve nil pointer in database connection`
- `test: add unit tests for HTTP handlers`

## Important Notes

- This is a **development environment** only — not for production use
- Database and Redis have no persistent volumes; data resets on `docker-compose down`
- All Go packages should follow standard Go naming conventions
- Use `go mod tidy` to clean up dependencies after adding imports
