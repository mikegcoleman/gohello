# Stage 1: Build the application
FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY main.go .

RUN go mod init myapp && go mod tidy

RUN go build -o myapp

# Stage 2: Create the final image
FROM alpine:3.19

WORKDIR /app

COPY --from=builder /app/myapp .

EXPOSE 80

CMD ["./myapp"]

