FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Install required packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    pandoc \
    inotify-tools \
    nodejs \
    npm \
    wget \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install reveal.js
RUN mkdir -p /opt/reveal.js && \
    wget -qO- https://github.com/hakimel/reveal.js/archive/master.tar.gz | tar xz --strip-components=1 -C /opt/reveal.js

# Create pandoc templates directory
RUN mkdir -p /usr/share/pandoc/data/templates/

# Download and install the reveal.js template for pandoc
RUN wget https://raw.githubusercontent.com/jgm/pandoc/master/data/templates/default.revealjs -O /usr/share/pandoc/data/templates/default.revealjs

# Install live-server globally
RUN npm install -g live-server