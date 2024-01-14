pragma circom 2.1.4;

template isZero(){
    signal input in;
    signal output out;

    signal inv;

    // calculate the inverse for in , if in is 0 then inv is 0 else 1/in
    inv <-- in!=0 ? 1/in : 0;

    // if inv is 0 then out is 1 else 0 
    // multiply inv with -in and add 1 to it
    out <== -in*inv + 1;
    in*out===0;
}

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

template Equality() {
   // Your Code Here..

   signal input a[3];
   signal output c;

   component isZero1 = isZero();
   component isZero2 = isZero();
   // component isZero3 = isZero();

   a[1] - a[0] ==> isZero1.in;
   a[2] - a[1] ==> isZero2.in;

   c <== isZero1.out*isZero2.out;
}

component main = Equality();