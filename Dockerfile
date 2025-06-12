# Use the official Golang image as the base image
FROM golang:1.24.3-alpine 

# Set the working directory inside the container
WORKDIR /app

# Copy the Go source code to the working directory
COPY main.go .

# Build the Go application
RUN go mod init myapp && go mod tidy
RUN GOOS=linux GOARCH=arm64 CGO_ENABLED=0 go build -o myapp

# Expose port 80
EXPOSE 80

# Command to run the application
CMD ["./myapp"]

