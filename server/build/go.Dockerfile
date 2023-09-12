FROM golang:1.20-alpine

WORKDIR /workspace/banmeshi/server

COPY ../go.mod ./

COPY ../go.sum ./


COPY ./cmd/* ./cmd/

COPY ./pkg/* ./pkg/grpc/

RUN go mod download && go mod verify

RUN go build -o ./go-main ./cmd/

EXPOSE 8080

CMD [ "./go-main" ]
# CMD [ "/bin/sh" ]