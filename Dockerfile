FROM gcc:13 AS builder

RUN apt-get update && apt-get install -y cmake

WORKDIR /app
COPY clock.cpp .

RUN g++ -static -o clock clock.cpp

FROM debian:bookworm-slim

COPY --from=builder /app/clock /app/clock

CMD ["/app/clock"]