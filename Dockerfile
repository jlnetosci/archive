##########################################
# Dockerfile for jlnetosci/archive:0.1.0 #
##########################################

FROM python:3.11.4-slim-bookworm
LABEL maintainer="João L. Neto (https://github.com/jlnetosci/)"

COPY /app/* /usr/local/bin/
RUN apt-get update; apt-get install -y wget; apt-get clean; \
pip install waybackpy==3.0.6 beautifulsoup4==4.12.2; \
chmod +x /usr/local/bin/archive /usr/local/bin/savepage; \
apt-get -y autoclean && apt-get -y autoremove
WORKDIR /usr/local/etc/