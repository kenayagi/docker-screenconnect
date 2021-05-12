FROM ubuntu:16.04

# Install dependencies
RUN apt-get update && apt-get -y install \
    procps \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Prepare directories
RUN mkdir /opt/screenconnect-installer

# Setup
ADD "https://d1kuyuqowve5id.cloudfront.net/ScreenConnect_20.2.29488.7513_Release.tar.gz" /opt/screenconnect-installer/ScreenConnect_Release.tar.gz
WORKDIR /opt/screenconnect-installer/
RUN tar xvf ScreenConnect_Release.tar.gz
RUN ScreenConnect_*_Install/install.sh

# Volume
VOLUME /opt/

# Ports
EXPOSE 8040 8041

# Command
WORKDIR /opt/screenconnect
CMD ["/opt/screenconnect/App_Runtime/bin/mono", "/opt/screenconnect/Bin/ScreenConnect.Service.exe", "startservices", "7"]
