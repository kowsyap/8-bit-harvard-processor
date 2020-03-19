`include "alu8.v"

module alu8_tb;

reg[7:0] a,b;
reg[3:0] opc;
wire carry;
wire[7:0] out,out2;

alu8 alu(a,b,opc,out,out2,carry);

initial begin

opc=4'd0;a=8'd220;b=8'd113;  //40,0
#2 opc=4'd1;  //0
#2 opc=4'd2;  //400
#2 opc=4'd3;  //1
#2 opc=4'd4;
#2 opc=4'd5;
#2 opc=4'd6;
#2 opc=4'd7;
#2 opc=4'd8;
#2 opc=4'd9;
#2 opc=4'd10;
#2 opc=4'd11;
#2 opc=4'd12;
#2 opc=4'd13;
#2 opc=4'd14;
#2 opc=4'd15;

end

initial
$monitor("t=%3d a=%d(%b),b=%d(%b),opc=%d,out=%b(%d),out2=%b(%d),carry=%d",$time,a,a,b,b,opc,out,out,out2,out2,carry);

endmodule