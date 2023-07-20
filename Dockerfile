FROM golang:1.18

## We create an /app directory within our
## image that will hold our application source
## files
RUN mkdir /app2

## We specify that we now wish to execute 
## any further commands inside our /app
## directory
WORKDIR /app2

COPY go.mod /app2
COPY go.sum /app2
RUN go mod download

## We copy everything in the root directory
## into our /app directory
ADD . /app2

## we run go build to compile the binary
## executable of our Go program
RUN go build -o main .

## Our start command which kicks off
## our newly created binary executable
CMD ["/app/main"]