pragma circom 2.1.6

template isZero(){
    signal input in;
    signal output out;

    signal inv;
    inv <-- in!=0 ? 1/in : 0;

    out <== -in*inv + 1;
    in*out===0;
}

template isEqual() {
    signal input in[2];
    signal output out;

    component isZ = isZero();

    in[0]-in[1] ==> isZ.in;

    out <== isZ.out; 
}