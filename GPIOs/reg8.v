module reg8(clk,rwdt1,rwdt2,address1,address2,in_data1,in_data2,out_data1,out_data2,w_en,p_en);
//general purpose register
//32 number of 8 bit registers
input clk;
input[4:0] address1,address2,rwdt1,rwdt2;
input[7:0] in_data1,in_data2;
input w_en,p_en;
output [7:0] out_data1,out_data2;
reg[7:0] reg_mem[0:31];
integer i,f;
initial begin
	for(i=0;i<32;i=i+1)
		reg_mem[i] <= 8'd0;
end

always@(posedge clk)
begin
	if(w_en==1'b1)
	begin
		reg_mem[rwdt1]=in_data1;
		reg_mem[rwdt2]=in_data2;
	end
	if(p_en==1'b1)
	begin
		f = $fopen("reg_out.o");
		$fwrite(f, "time =%d\n",$time, 
		"\treg_mem[0] = %b\n", reg_mem[0],
		"\treg_mem[1] = %b\n", reg_mem[1],
		"\treg_mem[2] = %b\n", reg_mem[2],
		"\treg_mem[3] = %b\n", reg_mem[3],
		"\treg_mem[4] = %b\n", reg_mem[4],
		"\treg_mem[5] = %b\n", reg_mem[5],
		"\treg_mem[6] = %b\n", reg_mem[6],
		"\treg_mem[7] = %b\n", reg_mem[7],
		"\treg_mem[8] = %b\n", reg_mem[8],
		"\treg_mem[9] = %b\n", reg_mem[9],
		"\treg_mem[10] = %b\n", reg_mem[10],
		"\treg_mem[11] = %b\n", reg_mem[11],
		"\treg_mem[12] = %b\n", reg_mem[12],
		"\treg_mem[13] = %b\n", reg_mem[13],
		"\treg_mem[14] = %b\n", reg_mem[14],
		"\treg_mem[15] = %b\n", reg_mem[15],
		"\treg_mem[16] = %b\n", reg_mem[16],
		"\treg_mem[17] = %b\n", reg_mem[17],
		"\treg_mem[18] = %b\n", reg_mem[18],
		"\treg_mem[19] = %b\n", reg_mem[19],
		"\treg_mem[20] = %b\n", reg_mem[20],
		"\treg_mem[21] = %b\n", reg_mem[21],
		"\treg_mem[22] = %b\n", reg_mem[22],
		"\treg_mem[23] = %b\n", reg_mem[23],
		"\treg_mem[24] = %b\n", reg_mem[24],
		"\treg_mem[25] = %b\n", reg_mem[25],
		"\treg_mem[26] = %b\n", reg_mem[26],
		"\treg_mem[27] = %b\n", reg_mem[27],
		"\treg_mem[28] = %b\n", reg_mem[28],
		"\treg_mem[29] = %b\n", reg_mem[29],
		"\treg_mem[30] = %b\n", reg_mem[30],
		"\treg_mem[31] = %b\n", reg_mem[31]);
		#130;
		$fclose(f);
	end
end

assign out_data1= reg_mem[address1];
assign out_data2= reg_mem[address2];

endmodule