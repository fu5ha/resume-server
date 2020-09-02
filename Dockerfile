FROM rustlang/rust:nightly as builder
WORKDIR /usr/src/resume-server
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
WORKDIR /root/
COPY ./Rocket.toml /root/Rocket.toml
COPY --from=builder /usr/local/cargo/bin/resume-server /usr/local/bin/resume-server
CMD ["resume-server"]