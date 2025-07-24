# Use an official Maven image with Java 11
FROM maven:3.9.6-eclipse-temurin-11

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_OPTS="-Xmx1024m"

# Create app directory
WORKDIR /app

# Optional: install additional tools if needed
RUN apt-get update && apt-get install -y git curl unzip && rm -rf /var/lib/apt/lists/*

# Copy plugin source into container
# (You can override this via volume mount in docker run)
COPY . /app

# Set default command
CMD ["mvn", "clean", "install"]
