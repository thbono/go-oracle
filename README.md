# go-oracle

Golang build container with Oracle instant client required by the "gopkg.in/rana/ora.v4" package.

Dockerfile example:

    FROM thbono/go-oracle

    ADD go/worker.go /go/src/worker/worker.go

    RUN go get -d -v github.com/streadway/amqp

    RUN go install worker

    ENTRYPOINT ["/go/bin/worker"]

Enjoy it!
