`include "mem8.v"
module mem8_tb;
reg[7:0] address;
reg w_en,en;
reg[7:0] in_data;
wire[7:0] out_data;

mem8 mmmm(address,in_data,out_data,w_en,en);

initial begin

#20 address=5'b01001;in_data=8'd45;w_en=1'b1;en=1'b1;
#20 address=5'b01101;in_data=8'd44;w_en=1'b0;en=1'b1;
#20 address=5'b11101;in_data=8'd54;w_en=1'b1;en=1'b1;
#20 address=5'b01001;in_data=8'd4;w_en=1'b1;en=1'b1;
#20 address=5'b00001;in_data=8'd40;w_en=1'b1;en=1'b1;
#20 address=5'b01101;in_data=8'd14;w_en=1'b1;en=1'b0;
#20 address=5'b01111;w_en=1'b0;


end
initial
$monitor("t=%3d address=%d,in_data=%d,out_data=%d,w_en=%d,en=%d\n",$time,address,in_data,out_data,w_en,en);
	 
endmodule
