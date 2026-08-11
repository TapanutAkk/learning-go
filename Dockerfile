FROM golang:1.23-alpine

# Install development tools
RUN apk add --no-cache \
    git \
    build-base \
    curl \
    vim \
    postgresql-client \
    redis

# Install golangci-lint for linting
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.55.2

# Set working directory
WORKDIR /app

# Copy go mod files if they exist
COPY go.* ./

# Download dependencies
RUN go mod download 2>/dev/null || true

# Default command - keep container running
CMD ["sh", "-c", "tail -f /dev/null"]
