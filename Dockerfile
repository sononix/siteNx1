FROM golang:1.9.2-alpine

RUN apk update
RUN apk upgrade
RUN apk add --no-cache git gcc
RUN go get github.com/gin-gonic/gin
RUN go get github.com/gin-contrib/static
RUN go get github.com/sononix/siteNx1

ENV SOURCES /go/src/github.com/sononix/siteNx1
COPY . ${SOURCES}

RUN cd ${SOURCES} && CGO_ENABLES=0 go build -o app .

WORKDIR ${SOURCES}
ENTRYPOINT ["./app"]

EXPOSE 80
