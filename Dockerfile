FROM golang:1.20-alpine AS builder

WORKDIR /app
COPY /app/main.go .

RUN go build /app/main.go

FROM scratch

COPY --from=builder /app/main /

CMD ["/main"]