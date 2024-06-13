FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y \
        python3.10 \
        python3-pip \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install PyYAML using Python package manager
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install PyYAML

# Copy Python script and entrypoint script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
