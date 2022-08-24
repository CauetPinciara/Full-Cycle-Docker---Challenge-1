FROM golang:1.18-bullseye as build  

WORKDIR $GOPATH/src/

COPY /app .

RUN go build && \
    mv hello ../bin

FROM scratch

COPY --from=build /go/bin .
ENTRYPOINT ["./hello"]

