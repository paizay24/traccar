# Use OpenJDK 11 image to run Traccar
FROM openjdk:11-jre-slim

# Install wget to download the Traccar release
RUN apt-get update && apt-get install -y wget

# Set working directory
WORKDIR /opt/traccar

# Copy everything from the local machine to the container's working directory
COPY . /opt/traccar

# Download Traccar binary (version 5.0 or latest stable release)
RUN wget https://github.com/traccar/traccar/releases/download/v5.0/traccar-linux-5.0.tar.gz

# Extract the downloaded file
RUN tar -xvzf traccar-linux-5.0.tar.gz

# Expose the necessary port (5055 is the default for Traccar GPS communication)
EXPOSE 5055

# Run the traccar binary when container starts
CMD ["./traccar", "start"]
