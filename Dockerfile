FROM debian:stretch

RUN apt-get update --fix-missing && apt-get install -y python3 apt-utils && \
    apt-get install -y wget bzip2 ca-certificates python3-setuptools build-essential imagemagick git && \
    easy_install3 pip && \
    pip install seaborn ggplot numpy pandas matplotlib requests blinker bottle click fluent_logger && \
    pip install git+git://github.com/manasgarg/plutoid.git && \
    pip install git+git://github.com/manasgarg/plutoid-web.git && \
    groupadd -r plutoid && useradd --no-log-init -r -m -d /home/plutoid -g plutoid plutoid && \
    mkdir /data && chown plutoid: /data

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

USER plutoid
WORKDIR /home/plutoid
EXPOSE 6699/tcp
