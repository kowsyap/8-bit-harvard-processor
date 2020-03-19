`include "mem8.v"
`include "reg8.v"
`include "alu8.v"

module datapath(clk,instr,op,mread,mwrite,alusrc,rdt,mtr,rwrite,regprint,opcode);
input clk;
input[31:0] instr;
input mread,mwrite,alusrc,rdt,mtr,rwrite,regprint;
input[1:0] op;
output[5:0] opcode;
wire[4:0] rwdt1,rwdt2,rsc1,rsc2;
wire[7:0] in_data1,in_data2,out_data1,out_data2,imm,out,out2,ddt,kgf,mem_data;
wire[3:0] opc;
wire carry;


//destination register address
assign rwdt1 = instr[25:21];
assign rwdt2 = (rdt==1'd1)? instr[20:16]:5'd0;

//source register address
assign rsc1 = instr[4:0];//b
assign rsc2 = (rdt==1'd1)? instr[9:5]:5'd0;//a

//immediate value
assign imm = instr[7:0];

//reg read  and write
reg8 gprs(clk,rwdt1,rwdt2,rsc1,rsc2,in_data1,in_data2,out_data1,out_data2,rwrite,regprint);

//alu control

assign opcode = instr[31:26];
assign opc = opcode[3:0];
//alu unit
alu8 allu(out_data2,out_data1,opc,op,out,out2,carry);

assign ddt = (mwrite==1'b1)? instr[25:18]:instr[7:0]; //load and store addresses
assign kgf = (alusrc==1'b1)? imm:out; //immediate and alu data

//memory block
mem8 memory(clk,ddt,out_data1,mem_data,mwrite,mread,regprint);

//write back
assign in_data1 = (mtr==1'b1)? mem_data:kgf;//load or others
assign in_data2 = out2;

endmodule