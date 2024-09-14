
# install snarjs2 which hash with blake3
if type snarkjs2 >/dev/null; then
    echo "snarkjs2 is installed (as a command, alias, or function)."
else
    git clone https://github.com/SuccinctPaul/snarkjs-blake3
    cd snarkjs-blake3
    # install related packages
    npm install
    npm install circom@latest

    # link related package
    npm link
    snarkjs2 -v
    echo "snarkjs2 is installed (as a command, alias, or function)."
fi


