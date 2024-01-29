# Build stage
FROM rust:bookworm AS builder
 
WORKDIR /app
COPY . .
RUN cargo build --release
 
# Final run stage
FROM debian:bookworm-slim AS runner
 
WORKDIR /app
COPY --from=builder /app/target/release/rust-postgres-crud-sqlx /app/rust-postgres-crud-sqlx
CMD ["/app/rust-postgres-crud-sqlx"]