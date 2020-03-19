module ir8(out_address,out_data);  
//instruction register
//64 number of 32 bit instructions
input[5:0] out_address;
output [31:0] out_data;
reg[31:0] ir_mem[0:63];
integer i,f;
initial begin
	for(i=0;i<32;i=i+1)
		ir_mem[i] <= 32'd0;
end

always@(*)
begin
	$readmemb("test.prog",ir_mem,0,63);
end

assign out_data=ir_mem[out_address];
endmodule