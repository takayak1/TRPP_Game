# Используем официальный образ Ubuntu для AMD64 в качестве базового образа
FROM --platform=linux/amd64 ubuntu:20.04

ENV XDG_RUNTIME_DIR=/tmp/runtime-dir

# Оставьте остальную часть Dockerfile без изменений
RUN apt-get update && \
    apt-get install -y \
    libgtk2.0-0 \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    libxi6 \
    libc6 \
    libglib2.0-0 \
    xvfb \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY build/ /app

RUN chmod +x /app/Game_linux.x86_64

CMD ["./Game_linux.x86_64"]

