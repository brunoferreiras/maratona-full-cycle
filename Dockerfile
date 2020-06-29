# Build stage
FROM golang:1.14.4-alpine3.11 AS build
WORKDIR /src
RUN apk --no-cache add build-base git bzr mercurial gcc
COPY go.mod go.sum /src/
RUN go mod download
COPY . .
RUN go build -o /src/full-cycle

# Application stage
FROM alpine:3.11
WORKDIR /app

COPY --from=build /src/full-cycle /app

ENTRYPOINT [ "./full-cycle" ]