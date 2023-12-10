FROM rust:1.74-alpine as builder

ARG APPNAME=api-server

RUN apk add --no-cache alpine-sdk build-base

WORKDIR /build
COPY Cargo.toml .
COPY Cargo.lock .
COPY src src
# -C target-feature=-crt-static
RUN cargo build --release --target x86_64-unknown-linux-musl
RUN cp /build/target/x86_64-unknown-linux-musl/release/$APPNAME /build/target/myapp

FROM alpine:3.18
WORKDIR /app
COPY --from=builder /build/target/myapp /app/myapp
EXPOSE 8080
CMD ["/app/myapp"]

