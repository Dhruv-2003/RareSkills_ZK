pragma circom 2.1.4;

// Create a circuit which takes an input 'a',(array of length 2 ) , then  implement power modulo 
// and return it using output 'c'.

// HINT: Non Quadratic constraints are not allowed. 

template Pow() {
   signal input a[2];
   signal output c;

   // could use binomial expansasion
   signal totalPow <== a[1];
   signal temp;
   temp <== a[0];
   signal val;
   // a[0] <== 1;
   for (var i = 1; i < totalPow; i++) {
      // temp <== a[0]*(a[1]-i)
      // terms[i] <== a[i-1]*temp;
      val <== temp * a[0];
      temp <== val;
   }
   
   // Your Code here.. 
   c <== val;
}

component main = Pow();

