- template arguements are allowed to make the code more ergonomic/flexible ,
- but each Circuit must be instantiated with a specific set of arguments , fixed

## ** Variables **

- We can also use extra variables which are not part of the circuits , just helper code that exists outside of the R1CS
- This is useful for example to make the code more readable , or to make the code more efficient

- Circom behave like normal C lang , thus normal operators works similar and only for variables , not signals

## ** Signals **

- Signals are immutable and intended to be one of the columns of the R1CS matrix.
- They are immutable because the witness entries have a fixed value and cannot be changed.

- <-- , <==, === signal assignment operators
- <-- is used to compute the signal value from the inputs , and assigns but don't constrains
- === is used to constrain the signal value to be equal to the assigned value
- <== is used to compute and assigns, then adds a constraint , it's for wiring the component together by referencing their inputs and outputs

- these operators can only be used with signals

### NOTE

- Circom does note require an output signal to exist , as that is merely syntatic sugar for a public inputs.
- Inputs are just an entry to the witness vecotr , so everything is input from a ZKP perspective

## ** Functions **

- If we are doing a lot of work with variables , functions for code cleaniness could be used

## ** Comparators.circom **

The comparators provided in this file are

- IsZero
- IsEqual (subtracts the two inputs and passes that to IsZero)
- LessThan
- LessEqThan (derived from LessThan)
- GreaterThan (derived from LessThan)
- GreaterEqThan (derived from LessThan)
- ForceEqualIfEnabled : No output , just works like an assertion

NOTE:: this comparators are actually constraints , instead of being mere checks like the `assert` in circom . This is not a part of the circuit
