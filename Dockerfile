FROM golang:alpine3.16 AS builder

WORKDIR /desafio-go

COPY . .

RUN go build index.go


FROM scratch

WORKDIR /desafio-go

COPY --from=builder /desafio-go/index .

ENTRYPOINT [ "./index" ]