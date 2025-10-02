FROM debian:trixie

RUN apt-get update && apt-get upgrade -y
RUN apt-get install live-build -y

VOLUME /repo

WORKDIR /repo

ENTRYPOINT ./setup_build.sh
