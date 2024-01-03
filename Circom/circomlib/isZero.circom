pragma circom 2.1.6

template isZero(){
    signal input in;
    signal output out;

    signal inv;
    inv = inv!=0 ? 1/inv : 0;

    out <== -in*inv + 1;
    in*out===0;
}

