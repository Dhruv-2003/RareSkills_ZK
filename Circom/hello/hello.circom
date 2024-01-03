pragma circom 2.1.6;

// template Multiply () {
//     signal input a;
//     signal input b;
//     signal output c;

//     c <== a * b;
// }

// component main = Multiply();



template Multiply2 () {
    signal input a;
    signal input b;
    signal input c;
    signal s1;
    signal output out;

    s1 <== a * b;
    out <== s1 * c;
}

component main {public [a,c]} = Multiply2();
