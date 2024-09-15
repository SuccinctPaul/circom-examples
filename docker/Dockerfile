FROM rust:1.67

RUN apt-get update && apt-get install -y curl clang openssl libssl-dev gcc g++ \
    pkg-config build-essential libclang-dev linux-libc-dev liburing-dev && \
    rm -rf /var/lib/apt/lists/* \

WORKDIR /home/rust

# install rust
#ENV RUSTUP_HOME=/usr/local/rustup \
#    CARGO_HOME=/usr/local/cargo \
#    PATH=/usr/local/cargo/bin:$PATH
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y && \
    rustup install nightly-2024-05-07 && \
    rustup default nightly-2024-05-07


# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && source ~/.bashrc
RUN nvm install 20  && npm install -g yarn && yarn set version 1.22.19

# copy env.
COPY . .

ENTRYPOINT ["sh"]
