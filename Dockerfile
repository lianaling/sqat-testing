FROM node:14.16.0

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends git htop vim jq

WORKDIR /workspace

RUN cd /workspace

RUN git clone https://github.com/signalapp/Signal-Desktop

RUN rm -rf /tmp/scripts

CMD ["sleep", "infinity"]
