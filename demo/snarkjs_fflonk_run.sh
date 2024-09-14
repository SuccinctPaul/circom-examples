npm install
npm link

# 1. Start a new powers of tau ceremony
snarkjs powersoftau new bn128 14 pot14_0000.ptau -v
# 2. Contribute to the ceremony
snarkjs powersoftau contribute pot14_0000.ptau pot14_0001.ptau -e="some random text" --name="First contribution" -v
# 3. Provide a second contribution
snarkjs powersoftau contribute pot14_0001.ptau pot14_0002.ptau --name="Second contribution" -e="some random text" -v
# 4. Provide a third contribution using third party software
snarkjs powersoftau export challenge pot14_0002.ptau challenge_0003
snarkjs powersoftau challenge contribute bn128 challenge_0003 response_0003 -e="some random text"
snarkjs powersoftau import response pot14_0002.ptau response_0003 pot14_0003.ptau -n="Third contribution name"
# 5. Verify the protocol so far
snarkjs powersoftau verify pot14_0003.ptau
# 6. Apply a random beacon
snarkjs powersoftau beacon pot14_0003.ptau pot14_beacon.ptau 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon"
# 7. Prepare phase 2
snarkjs powersoftau prepare phase2 pot14_beacon.ptau pot14_final.ptau -v
# 8. Verify the final ptau
snarkjs powersoftau verify pot14_final.ptau -v
# Export ptau as JSON (not part of tutorial)
snarkjs powersoftau export json pot14_final.ptau pot14_final.json -v

# 9. Create the circuit
cat > circuit.circom <<EOF
// Reference: https://docs.circom.io/getting-started/writing-circuits
pragma circom 2.1.0;

template Multiplier2() {
   // Declaration of signals.
   signal input a;
   signal input b;
   signal output c;

   // Constraints.
   c <== a * b;
}

component main = Multiplier2();
EOF

# 10. Compile the circuit
circom circuit.circom --r1cs --wasm --sym -c
# 11. View information about the circuit
snarkjs r1cs info circuit.r1cs
# 12. Print the constraints
snarkjs r1cs print circuit.r1cs circuit.sym
# 13. Export r1cs to json
snarkjs r1cs export json circuit.r1cs circuit.r1cs.json
cat circuit.r1cs.json


# 22. Calculate the witness
cat > input.json <<EOF
{"a": 3, "b": 11}
EOF

snarkjs wtns calculate circuit_js/circuit.wasm input.json witness.wtns
snarkjs wtns check circuit.r1cs witness.wtns
# 23. Debug the final witness calculation
snarkjs wtns debug circuit_js/circuit.wasm input.json witness.wtns circuit.sym --trigger --get --set


# 14. Generate the reference zkey without phase 2 contributions
# 34. Fflonk setup
snarkjs fflonk setup circuit.r1cs pot14_final.ptau circuit_final.zkey
# 35. Export the verification key
snarkjs zkey export verificationkey circuit_final.zkey verification_key.json

# 36. Create a FFLONK proof
snarkjs fflonk prove circuit_final.zkey witness.wtns proof.json public.json
# 37. Verify the FFLONK proof
snarkjs fflonk verify verification_key.json public.json proof.json
# 38. Turn the FFLONK verifier into a smart contract
snarkjs zkey export solidityverifier circuit_final.zkey verifier.sol
# 39. Simulate a FFLONK verification call
snarkjs zkey export soliditycalldata public.json proof.json

# Final Output
echo "===== Fflonk successfully"
