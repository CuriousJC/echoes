# Start with a minimal Go image
FROM golang:1.21 AS builder

# Set working directory inside container
WORKDIR /app

# Copy Go files and build the binary
COPY main.go .
RUN go mod init github.com/curiousjc/echoes && go mod tidy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o echoes .

# Use a small base image for final container
FROM alpine:latest

WORKDIR /root/
COPY --from=builder /app/echoes .

RUN chmod +x /root/echoes

# Expose the port
EXPOSE 8020

# Run the binary
CMD ["./echoes"]
