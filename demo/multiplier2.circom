pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/

// constance multi
template Multiplier2() {
   // Declaration of signals.
   signal a<==2;
   signal b<==3;
   signal output c;

   // Constraints.
   c <== a * b;
}

component main = Multiplier2();