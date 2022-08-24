FROM golang:alpine as builder

WORKDIR /go/src/app

COPY ./main.go .

RUN go mod init code-education && go build

FROM scratch
COPY --from=builder /go/src/app/code-education .
ENTRYPOINT [ "./code-education" ]
