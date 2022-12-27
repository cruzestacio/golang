FROM golang:1.18.9-alpine as builder

WORKDIR /app

COPY . .

RUN go mod init desafio/docker-golang

RUN apt-get update && apt-get install -f -y upx
RUN go build -a -gcflags=all="-l -B" -ldflags="-w -s" -o fullcycle
RUN upx fullcycle

FROM alpine:3.13.1 as b2

COPY --from=builder /app/fullcycle .

WORKDIR /app

CMD ["tail","-f","/dev/null"]
#ENTRYPOINT ["./fullcycle"] 