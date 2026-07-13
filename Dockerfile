FROM gcc:13 AS builder

RUN apt-get update && apt-get install -y cmake

WORKDIR /app
COPY hello-world.cpp .

RUN g++ -static -o hello-world hello-world.cpp

FROM debian:bookworm-slim

COPY --from=builder /app/hello-world /app/hello-world

CMD ["/app/hello-world"]