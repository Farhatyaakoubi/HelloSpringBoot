# Use the official Ubuntu 20.04 LTS image as the base image
FROM ubuntu:20.04

# Update the package list and install wget
RUN apt-get update && apt-get install -y wget

# Download and install OpenJDK 8
RUN apt-get install -y openjdk-8-jdk

# Set the JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Download and install Apache Tomcat 9.0.83
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz \
    && tar -xzvf apache-tomcat-9.0.83.tar.gz -C /opt \
    && ln -s /opt/apache-tomcat-9.0.83 /opt/tomcat

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
