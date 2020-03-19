`include "tff1.v"
module pc6(clk,reset,q);
//program counter
//6 bit counter i.e,64
output[5:0] q;
input clk,reset;

tff1 tff0(1'b1,clk,reset,q[0]);
tff1 tff11(1'b1,q[0],reset,q[1]);
tff1 tff2(1'b1,q[1],reset,q[2]);
tff1 tff3(1'b1,q[2],reset,q[3]);
tff1 tff4(1'b1,q[3],reset,q[4]);
tff1 tff5(1'b1,q[4],reset,q[5]);

endmodule