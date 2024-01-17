pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/comparators.circom";


/*
    Given a 4x4 sudoku board with array signal input "question" and "solution", check if the solution is correct.

    "question" is a 16 length array. Example: [0,4,0,0,0,0,1,0,0,0,0,3,2,0,0,0] == [0, 4, 0, 0]
                                                                                   [0, 0, 1, 0]
                                                                                   [0, 0, 0, 3]
                                                                                   [2, 0, 0, 0]

    "solution" is a 16 length array. Example: [1,4,3,2,3,2,1,4,4,1,2,3,2,3,4,1] == [1, 4, 3, 2]
                                                                                   [3, 2, 1, 4]
                                                                                   [4, 1, 2, 3]
                                                                                   [2, 3, 4, 1]

    "out" is the signal output of the circuit. "out" is 1 if the solution is correct, otherwise 0.                                                                               
*/


template Sudoku () {
    // Question Setup 
    signal input  question[16];
    signal input solution[16];
    signal output out;
    
    // Checking if the question is valid
    for(var v = 0; v < 16; v++){
        log(solution[v],question[v]);
        assert(question[v] == solution[v] || question[v] == 0);
    }
    
    var m = 0 ;
    component row1[4];
    var row1Out[4];
    for(var q = 0; q < 4; q++){
        row1[m] = IsEqual();
        row1Out[m] = solution[q];
        row1[m].in[0]  <== question[q];
        row1[m].in[1] <== 0;
        m++;
    }

    3 === row1[3].out + row1[2].out + row1[1].out + row1[0].out;
    // row1Out <== row1[3].out + row1[2].out + row1[1].out + row1[0].out;

    m = 0;
    component row2[4];
    var row2Out[4];
    for(var q = 4; q < 8; q++){
        row2[m] = IsEqual();
        row2Out[m] = solution[q];
        row2[m].in[0]  <== question[q];
        row2[m].in[1] <== 0;
        m++;
    }
    3 === row2[3].out + row2[2].out + row2[1].out + row2[0].out; 

    m = 0;
    component row3[4];
    var row3Out[4];
    for(var q = 8; q < 12; q++){
        row3[m] = IsEqual();
        row3Out[m] = solution[q];
        row3[m].in[0]  <== question[q];
        row3[m].in[1] <== 0;
        m++;
    }
    3 === row3[3].out + row3[2].out + row3[1].out + row3[0].out; 

    m = 0;
    component row4[4];
    var row4Out[4];
    for(var q = 12; q < 16; q++){
        row4[m] = IsEqual();
        row4Out[m] = solution[q];
        row4[m].in[0]  <== question[q];
        row4[m].in[1] <== 0;
        m++;
    }
    3 === row4[3].out + row4[2].out + row4[1].out + row4[0].out; 

    // Write your solution from here.. Good Luck!
    
    m = 0 ;
    component col1[4];
    var col1Out[4];
    for(var q = 0; q < 16; q += 4){
        col1[m] = IsEqual();
        col1Out[m] = solution[q];
        col1[m].in[0]  <== question[q];
        col1[m].in[1] <== 0;
        m++;
    }
    // 3 === col1[3].out + col1[2].out + col1[1].out + col1[0].out;

    m = 0;
    component col2[4];
    var col2Out[4];
    for(var q = 1; q < 16; q+= 4){
        col2[m] = IsEqual();
        col2Out[m] = solution[q];
        col2[m].in[0]  <== question[q];
        col2[m].in[1] <== 0;
        m++;
    }
    // 3 === col2[3].out + col2[2].out + col2[1].out + col2[0].out; 

    m = 0;
    component col3[4];
    var col3Out[4];
    for(var q = 2; q < 16; q+= 4){
        col3[m] = IsEqual();
        col3Out[m] = solution[q];
        col3[m].in[0]  <== question[q];
        col3[m].in[1] <== 0;
        m++;
    }
    // 3 === col3[3].out + col3[2].out + col3[1].out + col3[0].out; 

    m = 0;
    component col4[4];
    var col4Out[4];
    for(var q = 3; q < 16; q+= 4){
        col4[m] = IsEqual();
        col4Out[m] = solution[q];
        col4[m].in[0]  <== question[q];
        col4[m].in[1] <== 0;
        m++;
    }
    // 3 === col4[3].out + col4[2].out + col4[1].out + col4[0].out; 


    // need to check the 4x4 grid , for sudoku to be valid
    // condition is every row and column should have 1,2,3,4, no repeatation

    // the multiplication of the every row and column should be 24
    // 1*2*3*4 = 24

    component row[4];

    // row1
    // signal row1Out;
    signal r1temp1;
    signal r1temp2;
    signal r1temp3;
    r1temp1 <== row1Out[0] * row1Out[1];
    r1temp2 <== row1Out[2] * row1Out[3];
    r1temp3 <== r1temp1 * r1temp2;  
    row[0] = IsEqual();
    row[0].in[0]  <== r1temp3;
    row[0].in[1] <== 24;
    log(r1temp1,r1temp2,r1temp3,row[0].out);

    // signal row2Out;
    signal r2temp1;
    signal r2temp2;
    signal r2temp3;
    r2temp1 <== row2Out[0] * row2Out[1];
    r2temp2 <== row2Out[2] * row2Out[3];
    r2temp3 <== r2temp1 * r2temp2;  
    row[1] = IsEqual();
    row[1].in[0]  <== r2temp3;
    row[1].in[1] <== 24;
    log(r2temp1,r2temp2,r2temp3,row[1].out);

    // signal row3Out;
    signal r3temp1;
    signal r3temp2;
    signal r3temp3;
    r3temp1 <== row3Out[0] * row3Out[1];
    r3temp2 <== row3Out[2] * row3Out[3];
    r3temp3 <== r3temp1 * r3temp2;  
    row[2] = IsEqual();
    row[2].in[0]  <== r3temp3;
    row[2].in[1] <== 24;
    log(r3temp1,r3temp2,r3temp3,row[2].out);

    // signal row4Out;
    signal r4temp1;
    signal r4temp2;
    signal r4temp3;
    r4temp1 <== row4Out[0] * row4Out[1];
    r4temp2 <== row4Out[2] * row4Out[3];
    r4temp3 <== r4temp1 * r4temp2;  
    row[3] = IsEqual();
    row[3].in[0]  <== r4temp3;
    row[3].in[1] <== 24;
    log(r4temp1,r4temp2,r4temp3,row[3].out);

    component col[4];

    // signal col1Out;
    signal c1temp1;
    signal c1temp2;
    signal c1temp3;
    c1temp1 <== col1Out[0] * col1Out[1];
    c1temp2 <== col1Out[2] * col1Out[3];
    c1temp3 <== c1temp1 * c1temp2;  
    col[0] = IsEqual();
    col[0].in[0]  <== c1temp3;
    col[0].in[1] <== 24;
    log(c1temp1,c1temp2,c1temp3,col[0].out);

    // signal col2Out;
    signal c2temp1;
    signal c2temp2;
    signal c2temp3;
    c2temp1 <== col2Out[0] * col2Out[1];
    c2temp2 <== col2Out[2] * col2Out[3];
    c2temp3 <== c2temp1 * c2temp2;  
    col[1] = IsEqual();
    col[1].in[0]  <== c2temp3;
    col[1].in[1] <== 24;
    log(c2temp1,c2temp2,c2temp3,col[1].out);

    // signal col3Out;
    signal c3temp1;
    signal c3temp2;
    signal c3temp3;
    c3temp1 <== col3Out[0] * col3Out[1];
    c3temp2 <== col3Out[2] * col3Out[3];
    c3temp3 <== c3temp1 * c3temp2;  
    col[2] = IsEqual();
    col[2].in[0]  <== c3temp3;
    col[2].in[1] <== 24;
    log(c3temp1,c3temp2,c3temp3,col[2].out);

    // signal col4Out;
    signal c4temp1;
    signal c4temp2;
    signal c4temp3;
    c4temp1 <== col4Out[0] * col4Out[1];
    c4temp2 <== col4Out[2] * col4Out[3];
    c4temp3 <== c1temp1 * c1temp2;  
    col[3] = IsEqual();
    col[3].in[0]  <== c4temp3;
    col[3].in[1] <== 24;
    log(c4temp1,c4temp2,c4temp3,col[3].out);


    signal temp1 <== row[0].out*row[1].out;
    signal temp2 <== row[2].out*row[3].out;
    signal temp3 <== temp1*temp2;
    log(temp1,temp2,temp3);
    

    signal temp4 <== col[0].out*col[1].out;
    signal temp5 <== col[2].out*col[3].out;
    signal temp6 <== temp4*temp5;
    log(temp4,temp5,temp6);
    
    out <== temp3*temp6;
}


component main = Sudoku();

