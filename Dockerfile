FROM golang:1.18 as builder
# Set the working directory to the root directory path
WORKDIR /
# Copy over the binary built from the previous stage
COPY go.mod .
COPY hello.go .

RUN go build -o hello

# Create a new release build stage
FROM alpine:latest
# Set the working directory to the root directory path
WORKDIR /app
# Copy over the binary built from the previous stage
COPY --from=builder /hello .

CMD [ "./hello"]
