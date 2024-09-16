# Use an official Rust image as a base
FROM rust:1.67 as builder

# Install curl and bash for downloading NVM and managing the shell
RUN apt-get update && apt-get install -y --no-install-recommends curl bash && \
    rm -rf /var/lib/apt/lists/*

# Install NVM
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 14.18.1

RUN mkdir -p "$NVM_DIR" \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION \
    && npm install -g npm

# We need to set up the shell to source NVM every time
ENV PATH "$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH"

# Install required dependencies
RUN apt-get update && apt-get install \
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
    unzip


# Add a non-root user to run our commands (best practice)
RUN useradd -ms /bin/bash devuser
USER devuser

# Set up the working directory
WORKDIR /home/devuser/circom_demo


# Copy your source files (assuming you have a Rust and Node.js project)
COPY . .

# You might need to install additional dependencies for your Rust or Node.js projects
# For example, using cargo to install Rust dependencies
# RUN cargo install --path .

# Example command to start a Node.js server (if applicable)
# CMD ["node", "your-server.js"]

# Or, if you're just building a Rust project, you might want to build it
#CMD ["/bin/bash"]

# This example doesn't specify a CMD or ENTRYPOINT since it's a dev sandbox
# You should adjust CMD or ENTRYPOINT based on your project needs