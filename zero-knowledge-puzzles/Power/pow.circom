pragma circom 2.1.4;

// Create a circuit which takes an input 'a',(array of length 2 ) , then  implement power modulo 
// and return it using output 'c'.

// HINT: Non Quadratic constraints are not allowed. 

template Pow() {
   signal input a[2];
   signal output c;

   // could use binomial expansasion
   var totalPow = a[1];
   
   signal temp;
   temp <== a[0];

   signal value;
   value <-- temp**totalPow;

   // signal val;
   // // signal val[totalPow];
   // // val[0] <== a[0];

   // // a[0] <== 1;
   // // task it to calculate a[0] , a[1] times
   // for (var i = 1; i < totalPow; i++) {
   //    val <== val * temp;
   // }
   
   // Your Code here.. 
   c <== value;
}

component main = Pow();

