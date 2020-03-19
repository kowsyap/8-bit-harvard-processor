`include "control.v"
module control_tb;

reg[5:0] opcode;
wire[1:0] op;
wire mread,mwrite,alusrc,rdt,mtr,rwrite;

control ccc(opcode,op,mread,mwrite,alusrc,rdt,mtr,rwrite);

initial begin
#1 opcode = 6'b000000;
#1 opcode = 6'b100000;
#1 opcode = 6'b100001;
#1 opcode = 6'b100010;
#1 opcode = 6'b100011;
#1 opcode = 6'b010000;
#1 opcode = 6'b010001;


end
initial
$monitor("%d,%b,%b,%b,%b,%b,%b,%b,%b",$time,opcode,op,mread,mwrite,alusrc,rdt,mtr,rwrite);
	 
endmodule

