FROM golang:1.18 as builder

WORKDIR /

COPY go.mod .
COPY hello.go .

RUN go build -o hello

FROM scratch

WORKDIR /app
COPY --from=builder /hello .

CMD [ "./hello"]
