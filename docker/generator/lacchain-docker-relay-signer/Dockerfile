###MULTI SSTAGE BUILDS
### STAGE 1: Build ###
#FROM golang:1.11-alpine AS builder
FROM golang:1.18.1-alpine3.15 AS builder
RUN apk add --update git && apk add build-base  make gcc musl-dev linux-headers
RUN mkdir lacchain
WORKDIR /lacchain

RUN git clone  https://github.com/LACNetNetworks/gas-management.git
WORKDIR /lacchain/gas-management
RUN go mod download
RUN export GO111MODULE=on &&  go build  -o /go/bin/gas-relay-signer *.go

# ### STAGE 2: Setup ###
FROM alpine:latest
RUN apk add --no-cache ca-certificates
RUN  apk add gettext libintl && apk add curl

WORKDIR /opt/lacchain/gas-relay-signer

COPY ./files/relay-signer-config.toml /opt/lacchain/gas-relay-signer/config.toml.template
RUN chmod 0644 /opt/lacchain/gas-relay-signer/config.toml.template
COPY --from=builder /go/bin /opt/lacchain/gas-relay-signer
COPY ./files/startgas-relay-signer.sh /opt/lacchain/gas-relay-signer/startgas-relay-signer.sh
COPY ./files/start.sh /opt/lacchain/gas-relay-signer/start.sh
RUN chmod 755 /opt/lacchain/gas-relay-signer/startgas-relay-signer.sh
RUN chmod 777 -R /opt/lacchain/gas-relay-signer
ENTRYPOINT ["sh", "/opt/lacchain/gas-relay-signer/startgas-relay-signer.sh"]
CMD ["sh", "/opt/lacchain/gas-relay-signer/start.sh"]