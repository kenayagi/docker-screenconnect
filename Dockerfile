FROM debian:jessie

RUN apt-get update
RUN apt-get -y install wget

RUN mkdir /opt/screenconnect-installer

ADD "https://www.screenconnect.com/Download?Action=DownloadLatest&Platform=Linux&PreRelease=false" /opt/screenconnect-installer/ScreenConnect_Release.tar.gz

WORKDIR /opt/screenconnect-installer/

RUN tar xvf ScreenConnect_Release.tar.gz

RUN echo -e "\n\n" | ScreenConnect_*_Install/install.sh

VOLUME /opt/screenconnect/

EXPOSE 8040 8041

ADD run.sh /run.sh

WORKDIR /opt/screenconnect

CMD ["/bin/sh", "/run.sh"]
