# Circom Scripts


## install
> Need rust and npm.

* install circom
```bash
git clone https://github.com/iden3/circom.git
cd circom
cargo build --release
sudo cargo install --path circom
circom --help
```
> NOTE: If the last step failed, then you have to install it manually by export the binary path to `~/.bashrc`

* install snarkjs
```bash
sudo npm install snarkjs
```


## Backend
### with snarkjs
https://docs.circom.io/getting-started/proving-circuits/

### with plonky2
https://github.com/polymerdao/plonky2-circom

### with Nova
https://github.com/polymerdao/plonky2-circom

### with GKR
https://github.com/jeong0982/gkr



## Reference
* ![getting-started](https://docs.circom.io/getting-started/compiling-circuits/)


