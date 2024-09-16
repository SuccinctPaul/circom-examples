#!/usr/bin/env





# need npm
if type node >/dev/null; then
    echo "rustc is installed (as a command, alias, or function)."
else
    echo "rustc is not installed (as a command, alias, or function)."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
    nvm install node
    npm install -g yarn
    yarn set version 1.22.19
    echo "rustc is installed (as a command, alias, or function)."
fi


# need rust and npm
if type rustc >/dev/null; then
    echo "rustc is installed (as a command, alias, or function)."
else
    echo "rustc is not installed (as a command, alias, or function)."
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
    echo "rustc is installed (as a command, alias, or function)."
fi

# install circom
if type circom >/dev/null; then
    echo "circom is installed (as a command, alias, or function)."
else
    echo "circom is not installed (as a command, alias, or function)."
    git clone https://github.com/iden3/circom.git
    cd circom
    cargo build --release
    cargo install --path circom
    circom --help
    echo "circom is installed (as a command, alias, or function)."
    cd ..
fi

# install snarjs
if type snarkjs >/dev/null; then
    echo "snarkjs is installed (as a command, alias, or function)."
else
    sudo npm install -g snarkjs
    echo "snarkjs is installed (as a command, alias, or function)."
fi


