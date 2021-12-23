FROM golang:alpine AS builder

WORKDIR /src/app

COPY . .

RUN go build .

FROM scratch

WORKDIR /src/app

COPY --from=builder /src/app/golang-rocks .

CMD [ "./golang-rocks" ]
