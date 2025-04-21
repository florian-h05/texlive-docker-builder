FROM debian:12-slim

ARG DEBIAN_FRONTEND=noninteractive
ARG PLANTUML_VERSION=1.2024.3

# Install Make
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests make

# Install Inkscape
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests inkscape

# Install Python 3 and the required packages (use separate steps to utilize layer caching)
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests python3 python3-pip
RUN pip3 install --break-system-packages pygments~=2.19.1 pygments-style-kit latexminted~=0.5.1

# Install PlantUML (use separate steps to utilize layer caching)
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests wget graphviz openjdk-17-jre-headless
RUN wget -q -O - https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar > /usr/local/bin/plantuml.jar && \
    chmod +x /usr/local/bin/plantuml.jar
# Create PlantUML wrapper script
RUN echo '#!/bin/sh\nexec java -jar /usr/local/bin/plantuml.jar "$@"' > /usr/local/bin/plantuml && \
    chmod +x /usr/local/bin/plantuml

# Set the working directory
WORKDIR /workspace

# Install TeX Live 2024 (use separate steps to utilize layer caching)
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests wget perl latexmk xz-utils
ADD texlive.profile /texlive.profile 
RUN wget ftp://tug.org/historic/systems/texlive/2024/tlnet-final/install-tl-unx.tar.gz && \
    tar -xzf install-tl-unx.tar.gz && \
    cd install-tl-* && \
    perl ./install-tl --no-interaction --profile /texlive.profile --repository ftp://tug.org/historic/systems/texlive/2024/tlnet-final && \
    cd .. && \
    rm -rf install-tl-*
# RUN tlmgr option repository ftp://tug.org/historic/systems/texlive/2024/tlnet-final
# Install additional packages
ADD additional_texlive_packages.txt /additional_texlive_packages.txt
RUN tlmgr install $(cat /additional_texlive_packages.txt)
# Install additional fonts & languages
RUN tlmgr install wasy babel-german
