FROM messense/rust-musl-cross:x86_64-musl AS builder

ENV SQLX_OFFLINE=true

WORKDIR /rust-api-deployment-example

COPY . .

RUN cargo build --release --target x86_64-unknown-linux-musl


FROM scratch
COPY --from=builder /rust-api-deployment-example/target/x86_64-unknown-linux-musl/release/rust-api-deployment-example /rust-api-deployment-example
ENTRYPOINT ["/rust-api-deployment-example"]

EXPOSE 3000