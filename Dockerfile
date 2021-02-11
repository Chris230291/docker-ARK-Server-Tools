FROM cm2network/steamcmd
LABEL maintainer="Chris"

# Update ARK tools on stratup?
ENV UPDATETOOLS 1

# Start servers on startup?
ENV STARTSERVERS 1

# Install Dependencies
USER root
RUN apt-get update -y && apt-get install -y \
    bash \
    git \
    coreutils \
    findutils \
    perl \
    rsync \
    sed \
    tar \
    sudo \
    perl-modules \
    curl \
    lsof \
    libc6-i386 \
    lib32gcc1 \
    bzip2 \
    cron \
    nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
# No password for steam sudo
RUN sed -i '/\#includedir \/etc\/sudoers.d/a steam ALL=(ALL) NOPASSWD: ALL' /etc/sudoers

# Install ARK Server Tools
USER steam
RUN curl -sL https://git.io/arkmanager | sudo bash -s steam

# Copy start.sh
COPY start.sh /home/steam/start.sh 
RUN sudo chmod +x /home/steam/start.sh

# Go
ENTRYPOINT ["/home/steam/start.sh"]
