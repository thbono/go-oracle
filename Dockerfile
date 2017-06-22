FROM golang:1.8

# Required for building the Oracle DB driver
ADD oci8.pc /usr/lib/pkgconfig/oci8.pc
ADD instantclient-basic-linux.x64-*.zip ./
ADD instantclient-sdk-linux.x64-*.zip ./

RUN apt-get update && apt-get install -y --no-install-recommends \
	unzip \
        libaio1 \
        && rm -rf /var/lib/apt/lists/*

# Unzip instant client.
RUN unzip instantclient-basic-linux.x64-*.zip -d / \
    && unzip instantclient-sdk-linux.x64-*.zip -d / \
    && ln -s /instantclient_11_2/libclntsh.so.11.1 /instantclient_11_2/libclntsh.so

# The package config doesn't seem to be enough, this is also required.
ENV LD_LIBRARY_PATH /instantclient_11_2

# Get ora dep
RUN go get -d -v gopkg.in/rana/ora.v4
