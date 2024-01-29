FROM rust::bookworm AS builder

WORKDIR /app

COPY . .

RUN cargo build --release

FROM debian:bookworm-slim AS runner

WORKDIR /app

COPY --from=biulder /app/target/release/rust-postgres-crud-sqlx /app/rust-postgres-crud-sqlx

CMD ["/app/rust-postgres-crud-sqlx"]