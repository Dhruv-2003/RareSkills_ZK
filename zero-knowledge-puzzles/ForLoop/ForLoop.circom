pragma circom 2.1.4;

// Input : 'a',array of length 2 .
// Output : 'c 
// Using a forLoop , add a[0] and a[1] , 4 times in a row .

template ForLoop() {
    signal input a[2];
    signal output c;
    // Your Code here..
    var i;
    signal sum[4];
    for(i=0;i<4;i++){
       sum[i] <== a[0] + a[1];
    }

    c <== sum[1] + sum[2] + sum[3] + sum[0];

}  

component main = ForLoop();
