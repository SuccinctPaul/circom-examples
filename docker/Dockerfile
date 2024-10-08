FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update && apt-get install -y \
    cmake \
    make \
    bash \
    git \
    openssl \
    libssl-dev \
    gcc \
    g++ \
    curl \
    pkg-config \
    software-properties-common \
    jq \
    openssh-server \
    openssh-client \
    vim \
    emacs \
    ca-certificates \
    gnupg2 \
    postgresql-client \
    wget \
    bzip2 \
    hub \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Install NVM
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 18.19.1

RUN mkdir -p "$NVM_DIR" \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION \
    && npm install -g npm

# We need to set up the shell to source NVM every time
ENV PATH "$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH"


# install snarkjs
RUN npm install -g snarkjs
# install snarkjs2
RUN git clone https://github.com/SuccinctPaul/snarkjs-blake3 && cd snarkjs-blake3 && npm install && npm link

# set workdir
WORKDIR /root

COPY . /app


# EXPOSE 8080

# CMD ["node", "app.js"]