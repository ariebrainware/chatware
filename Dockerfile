FROM golang:1.12.5-alpine3.9 AS build

WORKDIR /go/src/chatware
COPY . /go/src/chatware

#Install git manually for alpineOS
RUN apk add --no-cache git

#Get all dependencies
RUN go get -d -v ./...
RUN go install -v ./...

#Build all go files
RUN go build -o chatware

CMD ["./chatware"]