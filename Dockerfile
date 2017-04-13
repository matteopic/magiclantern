FROM ubuntu:17.04

RUN apt-get update && \
    apt-get install wget mercurial -yq
