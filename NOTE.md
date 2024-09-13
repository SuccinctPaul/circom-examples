
### Tool tips
* output the circuit info
```bash
snarkjs info -r circuit.r1cs
```
* output the r1cs constraints
```bash
snarkjs r1cs print circuit.r1cs circuit.sym 
```
* circom check
  It'll show hint,warning or error.
```bash
circom --inspect
```



## circom grammer

### gramma
#### version info
Define the gramma version: `pragma circom xx.yy.zz;`

#### signal
* visibility
  Signal means the wires in circuit. It can be input(witness), intermediate(advice), output(instance) wires.
    * Signal as input wires are private defaultly, while can be set as public. `signal input in1;`
    * Signal as output wires are always public. `signal output out;`
    * Signal as intermediate wires are just a normal private wires. `signal x1;`

* immutable
  Like wire in circuit, the signal are immutable.
* type behand signal
  As the circuit are defined on finite field, so what type behand signal is BigInt(Field).
* assign
    * assign: `<--` or `-->`
    * assign and constraint: `<==` or `==>`

#### Variable
Variables are identifiers that hold non-signal data and are mutable.
Variables are declared using the keyword var as in: `var x;`

* Type
    * Field elemment
    * arrays: `var x[3] = [2,8,4];`


#### more on doc
* ![keyword](https://docs.circom.io/circom-language/reserved-keywords/)
* ![operator](https://docs.circom.io/circom-language/basic-operators/)
* ![constraint generate](https://docs.circom.io/circom-language/constraint-generation/)
* ![constrol flow](https://docs.circom.io/circom-language/control-flow/#loop-statement-while)



#### comment
* `// this is a comment`
* `/* this is another comment*/`


### Template&Component
* Template
  Like the class in OOP language, it's used for reuse by other circuit.
  Templates cannot include local functions or template definitions.

    * custome template (since v>=2.0.6)
      Deifne it as: `template custom Example() {...}`

      > The diff between custome Template and standard Template is the about encoded-arithmetic system.The stardard Template will generate r1cs constraints, while the cusomte Template generate the Plonk constraints(Plonk's custom gates).
      > This means that custom templates cannot introduce any constraint inside their body, nor declare any subcomponent.

* Component
  And the instantiation of template is called `circuit object`, which compse ther circuits.

Components are immutable.

When instanlize a template, it can be decorated by a keyword `parallel` to parallel compute witness.

* main component
  For a execable `.circom` file must have an execute entry: `main`.
  `component main {public [signal_list]} = tempid(v1,...,vn);`

  In all the circom project, there is one and only one main component can be define.
  Without it just is a circom lib, eg: ![circomlib](https://github.com/iden3/circomlib).

* import template from lib
  Templates can be found in other files like in libraries: `include "a.circom"`



* Example
  Suppose there is a template named `template A(N1,N2){...}`, so we can invoke it from another template by `component c = A(a,N);`


### Functions
Function can be defined as:
```circom
function fn_name(param1, ..., paramn){
  ...
  return x;
}
```

### Other
* assert: `assert(bool_expression);`
* debug: `log("Expected: ",135,". actua:l",a);`




## circom compiler

### command

```bash
circom multiplier2.circom --r1cs --wasm --sym --c
```
> see more ![detail](https://docs.circom.io/getting-started/compiling-circuits)




### Two compilation phases:
* The construction phase, where the constraints are generated.
* The code generation phase, where the code to compute the witness is generated.



## witness
The set of inputs, intermediate signals and output is called witness.

It's a json file with <signal_name, value>.

