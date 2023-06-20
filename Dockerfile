FROM ubuntu:bionic
MAINTAINER Julien ARMENGAUD <julien.armengaud@viveris.fr>
LABEL description="Docker with Petalinux 2022.1 SDK for Ultra96 board"


# Reset workdir
WORKDIR /


# Install requiered packages
RUN	apt update && \
	apt install --yes python make && \
	apt clean


# Copy SDK to docker
COPY sdk-ultra96.sh /
RUN chmod 777 sdk-ultra96.sh


# Install SDK
RUN 	mkdir /opt/petalinux-sdk && \
	./sdk-ultra96.sh -d /opt/petalinux-sdk -y && \
	rm -rf sdk-ultra96.sh


# Workdir
RUN mkdir /workdir
RUN chmod -R 777 /workdir
WORKDIR /workdir