FROM ubuntu:24.04

LABEL project="webapp"
LABEL maintainer="chetan@gmail.com"
LABEL Autor="chetan"

WORKDIR /app
COPY . /app

RUN apt-get update -y
RUN apt install apache2 -y

ENV DEBAIN_FRONTEND=non-interactive

CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]

EXPOSE 80

VOLUME /var/apache/log
ADD . /var/www/html/