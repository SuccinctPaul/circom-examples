#!/usr/bin/env


# need rust and npm



# install circom
if type circom >/dev/null; then
    echo "circom is installed (as a command, alias, or function)."
else
    echo "circom is not installed (as a command, alias, or function)."
    git clone https://github.com/iden3/circom.git
    cd circom
    cargo build --release
    sudo cargo install --path circom
    circom --help
    echo "circom is installed (as a command, alias, or function)."
    cd ..
fi

# install snarjs
if type snarkjs >/dev/null; then
    echo "snarkjs is installed (as a command, alias, or function)."
else
    sudo npm install snarkjs
    echo "snarkjs is installed (as a command, alias, or function)."
fi


