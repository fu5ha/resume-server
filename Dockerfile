FROM rustlang/rust:nightly as builder
WORKDIR /usr/src/resume-server
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
WORKDIR /root/
COPY --from=builder /usr/local/cargo/bin/resume-server /usr/local/bin/resume-server
CMD ["resume-server"]