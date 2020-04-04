FROM rust:latest as builder
WORKDIR /usr/src/alcatraz_backend
COPY ./Backend .
RUN cargo install --path ./appserver

FROM ubuntu:latest
# RUN apt-get update && apt-get install -y extra-runtime-dependencies
COPY --from=builder /usr/local/cargo/bin/appserver /usr/local/bin/appserver
CMD ["appserver"]