FROM        openjdk:11-jre-slim

LABEL       author="Thien Tran" maintainer="contact@thientran.io"

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get autoremove -y \
 && apt-get autoclean \
 && useradd -d /home/container -m container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]