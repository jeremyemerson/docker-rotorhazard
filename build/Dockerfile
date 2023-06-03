FROM ubuntu

ARG PYTHON_VERSION=3.10
ARG VERSION=3.2.1
# ARG PORT=5000

ENV DEBIAN_FRONTEND noninteractive

# Install python
RUN apt update \
    && apt install -y wget build-essential libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt update \
    && apt install -y python${PYTHON_VERSION} python3-pip \
    && update-alternatives --install /usr/bin/python python /usr/bin/python${PYTHON_VERSION} 1 \
    && update-alternatives --set python /usr/bin/python${PYTHON_VERSION}
    # && apt clean

# Install rotorohazard
RUN apt install unzip \
    # && rm -rf /opt/rotorhazard \
    && wget https://codeload.github.com/RotorHazard/RotorHazard/zip/v${VERSION} -O /tmp/rotorhazard.zip \
    && mkdir -p /tmp/rotorhazard \
    && unzip /tmp/rotorhazard.zip -d /tmp/rotorhazard/ \
    && mv /tmp/rotorhazard/RotorHazard-${VERSION} /tmp/rotorhazard/RotorHazard \
    && rm -rf /tmp/rotorhazard.zip \
    && python -m pip install -r /tmp/rotorhazard/RotorHazard/src/server/reqsNonPi.txt

# Configure init script
COPY init_rotorhazard.sh /opt/init_rotorhazard.sh
RUN chmod u+x /opt/init_rotorhazard.sh

VOLUME ["/opt/rotorhazard","/dev"]

WORKDIR /opt

EXPOSE 5000

# HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["/opt/init_rotorhazard.sh"]
# ENTRYPOINT ["/bin/bash"]