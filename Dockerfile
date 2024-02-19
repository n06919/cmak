# Base image
FROM openjdk:11

# Install git
RUN apt-get update && \
    apt-get install -y git

# Clone the repository
RUN git clone https://github.com/yahoo/CMAK.git /cmak

# Set the working directory
WORKDIR /cmak

# sbt clean and dist
RUN ./sbt clean dist

EXPOSE 9000

# Run the application
CMD ["./sbt", "run"]
# CMD ["/bin/sleep", "70000"]
