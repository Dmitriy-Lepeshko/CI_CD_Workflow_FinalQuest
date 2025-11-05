# Сборка
FROM golang:1.24-alpine AS builder

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o main .

# Финальный образ
FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /app/main /main
CMD ["/main"]