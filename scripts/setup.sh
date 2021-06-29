#!/usr/bin/env bash

PACKAGE_LIST="apt-utils \
        git \
        git-lfs \
        htop \
        curl \
        wget \
        unzip \
        zip \
        vim \
        less \
        sudo \
        jq \
        man-db"

# install packages
apt-get -y install --no-install-recommends ${PACKAGE_LIST}

