FROM golang:1.17-alpine

RUN apk update && apk add git nano
COPY . /go/src/github.com/DoManhQuang/docker-file-log-driver
WORKDIR /go/src/github.com/DoManhQuang/docker-file-log-driver

RUN go mod init github.com/DoManhQuang/docker-file-log-driver
RUN go get -v github.com/docker/docker@v20.10.14+incompatible
RUN go get -v github.com/docker/go-plugins-helpers@v0.0.0-20211224144127-6eecb7beb651
RUN go get -v github.com/pkg/errors@v0.9.1
RUN go get -v github.com/sirupsen/logrus@v1.8.1
RUN go get -v github.com/containerd/fifo@v1.0.0
RUN go get -v github.com/containerd/containerd/errdefs
RUN go get -v github.com/gogo/protobuf@v1.3.2
RUN go get -v github.com/snowzach/rotatefilehook

RUN go get github.com/containerd/containerd/errdefs
RUN go get github.com/coreos/go-systemd/activation
RUN go get github.com/docker/distribution/registry/api/errcode
RUN go get github.com/docker/go-connections/nat
RUN go get github.com/docker/go-connections/sockets
RUN go get github.com/docker/go-connections/tlsconfig
RUN go get github.com/docker/go-metrics
RUN go get github.com/docker/go-units
RUN go get github.com/fsnotify/fsnotify
RUN go get github.com/moby/term
RUN go get github.com/morikuni/aec
RUN go get github.com/opencontainers/image-spec/specs-go/v1
RUN go get golang.org/x/time/rate
RUN go get google.golang.org/grpc/codes
RUN go get google.golang.org/grpc/status

RUN go build --ldflags '-extldflags "-static"' -o /usr/bin/docker-file-log-driver
# CMD ["/bin/sh"]