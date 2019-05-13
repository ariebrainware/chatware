FROM golang:1.12.5-alpine3.9

WORKDIR /go/src/chatware
COPY . .

#Install git manually for alpineOS
RUN apk add git

#Get all dependencies
RUN go get -d -v ./...
RUN go install -v ./...

#Build all go files
RUN go build *.go -o chatware

CMD ["chatware"]