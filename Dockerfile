FROM node:14.16.0

# Get the script to install git-lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

# Install git, git-lfs and other libraries
RUN apt-get update && apt-get install \
    git git-lfs htop vim jq libx11-xcb1 libxcb-dri3-0 libxtst6 libnss3 libatk-bridge2.0-0 libgtk-3-0 libxss1 libasound2 \
    -yq --no-install-suggests --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Electron doesn't like to run as root
RUN useradd -d /sqat sqat
USER sqat

WORKDIR /sqat

# Clone the signal code
RUN git clone https://github.com/signalapp/Signal-Desktop

WORKDIR /sqat/Signal-Desktop

# Setup git-lfs and install dependencies
RUN git-lfs install && yarn install --frozen-lockfile

# Electron needs root for sandboxing
# see https://github.com/electron/electron/issues/17972
USER root
RUN chown root /sqat/Signal-Desktop/node_modules/electron/dist/chrome-sandbox
RUN chmod 4755 /sqat/Signal-Desktop/node_modules/electron/dist/chrome-sandbox

USER sqat

CMD ["sleep", "infinity"]
