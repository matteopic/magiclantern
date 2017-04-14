# MagicLantern Build Environment

FROM ubuntu:17.04
MAINTAINER matteopic

RUN apt-get update && \
    apt-get install mercurial sudo wget -yq && \
	cd /usr/src && \ 
	hg clone -u unified https://bitbucket.org/shadowfax/magic-lantern

RUN apt-get install build-essential less bzip2 lib32ncurses5 -yq && \
    cd /tmp && \
    wget --no-verbose https://launchpad.net/gcc-arm-embedded/4.8/4.8-2013-q4-major/+download/gcc-arm-none-eabi-4_8-2013q4-20131204-linux.tar.bz2 && \
	tar -xvjf gcc-arm-none-eabi-4_8-2013q4-20131204-linux.tar.bz2 && \
	mv gcc-arm-none-eabi-4_8-2013q4 ~/gcc-arm-none-eabi-4_8-2013q4

# Avoid CPAN prompt for confirmation
ENV PERL_MM_USE_DEFAULT=1
ENV PERL_EXTUTILS_AUTOINSTALL="--defaultdeps"

RUN apt-get install perl python -yq && \
    perl -MCPAN -e 'install File::Slurp'
