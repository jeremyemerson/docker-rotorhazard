FROM ubuntu

ENV VERSION=3.2.1
ENV PORT=5000

ENV DEBIAN_FRONTEND noninteractive

ARG PYTHON_VERSION=3.10

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
    && wget https://codeload.github.com/RotorHazard/RotorHazard/zip/v${VERSION} -O /tmp/rotorhazard.zip \
    && mkdir -p /tmp/rotorhazard \
    && unzip /tmp/rotorhazard.zip -d /tmp/rotorhazard/ \
<<<<<<< HEAD:docker-rotorhazard/Dockerfile
    && mv /tmp/rotorhazard/RotorHazard-${ROTORHAZARD_VERSION} /tmp/rotorhazard/RotorHazard \
=======
    && mv /tmp/rotorhazard/RotorHazard-${VERSION} /opt/rotorhazard \
>>>>>>> 3327dbeb7036281511e58241d709eb508c11c712:Dockerfile
    && rm -rf /tmp/rotorhazard.zip \
    && python -m pip install -r /tmp/rotorhazard/RotorHazard/src/server/reqsNonPi.txt

COPY init.sh /opt/rotorhazard/init.sh
RUN chmod u+x /opt/rotorhazard/init.sh

# VOLUME ["/opt/rotorhazard/RotorHazard"]

WORKDIR /opt/rotorhazard

EXPOSE ${PORT}

# HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1

# ENTRYPOINT ["./init.sh"]
ENTRYPOINT ["/bin/bash"]