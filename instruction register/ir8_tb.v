`include "ir8.v"
module ir8_tb;
reg[5:0] address;
wire[31:0] out_data;

ir8 rrr(address,out_data);

initial begin
address=5'd0;
#20 address=5'd1;
#20 address=5'd2;
#20 address=5'd8;
end
initial
$monitor("t=%3d address=%d,out_data=%b \n",$time,address,out_data);
	 
endmodule
