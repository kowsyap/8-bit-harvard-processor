`include "reg8.v"
module reg8_tb;
reg[4:0] address1,address2;
reg w_en;
reg[7:0] in_data1,in_data2;
wire[7:0] out_data1,out_data2;

reg8 rrr(address1,address2,in_data1,in_data2,out_data1,out_data2,w_en);


initial begin

#20 address1=5'b01001;address2=5'b01101;in_data1=8'd45;in_data2=8'd67;w_en=1'b1;
#20 address1=5'b01101;address2=5'b01001;in_data1=8'd44;in_data2=8'd7;w_en=1'b0;
#20 address1=5'b01111;address2=5'b01110;w_en=1'b0;


end
initial
$monitor("t=%3d address1=%d,address2=%d,in_data1=%d,in_data2=%d,out_data1=%d,out_data2=%d,w_en=%d\n",$time,address1,address2,in_data1,in_data2,out_data1,out_data2,w_en);
	 
endmodule
