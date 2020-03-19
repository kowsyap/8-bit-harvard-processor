`include "pc6.v"
`include "ir8.v"
`include "datapath.v"
`include "control.v"
module main8(clk,reset);

input clk,reset;
wire mread,mwrite,alusrc,rdt,mtr,rwrite,regprint;
wire[1:0] op;
wire [5:0] opcode,q;
wire[31:0] instr;
 
pc6 ppp(clk,reset,q);
ir8 iii(q,instr);
datapath daa(clk,instr,op,mread,mwrite,alusrc,rdt,mtr,rwrite,regprint,opcode);
control con(opcode,op,mread,mwrite,alusrc,rdt,mtr,rwrite,regprint);

endmodule