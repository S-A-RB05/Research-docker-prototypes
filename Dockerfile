FROM alpine:latest

# Create a directory inside the container
WORKDIR /data

# Add a large file to the container
RUN dd if=/dev/zero of=large_file.txt bs=1M count=100

# Define the entry point
CMD ["sleep", "infinity"]
