pragma circom 2.1.4;

template isZero() {

    // Your code here.
    signal input in;
    signal output out;

    signal inv;
    inv <-- in!=0 ? 1/in : 0;

    out <== -in*inv + 1;
    out*in === 0;
}

// Input : a , length of 2 .
// Output : c .
// In this exercise , you have to check that a[0] is NOT equal to a[1], if not equal, output 1, else output 0.
// You are free to use any operator you may like . 

// HINT:NEGATION

template NotEqual() {

    // Your code here.
    signal input a[2];
    signal output c;
    
    component isZero = isZero();

    a[1]-a[0]  ==> isZero.in;
    
    c <== 1 - isZero.out;
   
}

component main = NotEqual();