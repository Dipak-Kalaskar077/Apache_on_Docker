# Use an official OpenJDK image as the base
FROM openjdk:11-jdk-slim

# Set environment variables for Tomcat version
ENV TOMCAT_VERSION 10.1.13

# Download and install Tomcat
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://downloads.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    mv apache-tomcat-${TOMCAT_VERSION} /usr/local/tomcat && \
    rm apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    apt-get remove -y wget && \
    apt-get clean

# Expose Tomcat's port
EXPOSE 8080

# Set the working directory to the Tomcat installation directory
WORKDIR /usr/local/tomcat

# Start Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
