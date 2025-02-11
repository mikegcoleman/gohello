# Stage 1: Build the application
# FROM golang:1.23.6-alpine3.21 AS builder
FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY main.go .

RUN go mod init myapp && go mod tidy

RUN GOOS=linux GOARCH=arm64 CGO_ENABLED=0 go build -o myapp

# Stage 2: Create the final image
FROM scratch

WORKDIR /app

COPY --from=builder /app/myapp .

EXPOSE 80

CMD ["./myapp"]

