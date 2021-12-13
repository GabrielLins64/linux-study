FROM debian:bullseye

RUN apt update
RUN apt install -y procps less tree man sudo vim
COPY scripts /home/scripts
