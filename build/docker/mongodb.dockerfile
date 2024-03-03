# Use a base image (Ubuntu 22.04 LTS)
FROM ubuntu:22.04

# Update package lists and install gnupg
RUN apt-get update && apt-get install -y gnupg curl systemd && \
    curl -fsSL https://pgp.mongodb.com/server-6.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-6.0.gpg && \
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list && \
    apt-get update && apt-get install -y mongodb-org

# Start MongoDB service (if '/usr/bin/mongod' is not already running)
CMD ["mongod"]

# Enable MongoDB to start automatically on system boot
RUN systemctl enable mongod
