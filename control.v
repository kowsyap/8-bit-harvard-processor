module control(opcode,op,mread,mwrite,alusrc,rdt,mtr,rwrite,regprint);
input[5:0] opcode;
output reg[1:0] op;
output reg mread,mwrite,alusrc,rdt,mtr,rwrite,regprint;

always@(*)
begin
	case(opcode)
	6'b100000: //mvi
	 begin
		rdt = 1'b0;
		alusrc = 1'b1;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b10;
		regprint = 1'b0;
	 end
	6'b100001: //mov
	 begin
		rdt = 1'b0;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b10;
		regprint = 1'b0;
	 end
	6'b100010: //load
	 begin
		rdt = 1'b0;
		alusrc = 1'b0;
		mtr = 1'b1;
		rwrite = 1'b1;
		mread = 1'b1;
		mwrite = 1'b0;
		op = 2'b10;
		regprint = 1'b0;
	 end
	6'b100011: //store
	 begin
		rdt = 1'b0;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b0;
		mread = 1'b0;
		mwrite = 1'b1;
		op = 2'b10;
		regprint = 1'b0;
	 end
	6'b010000: //add
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b010001: //sub
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b010010: //mul
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b010011: //div
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b010100: //shl
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b010101: //shr
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b010110: //rol
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b010111: //not
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b011000: //and
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b011001: //or
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b011010: //nand
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b011011: //nor
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b011100: //xor
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b011101: //xnor
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b011110: //gr
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b011111: //eq
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	6'b111111: //hlt
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b1;
	 end
	default:
	 begin
		rdt = 1'b1;
		alusrc = 1'b0;
		mtr = 1'b0;
		rwrite = 1'b1;
		mread = 1'b0;
		mwrite = 1'b0;
		op = 2'b01;
		regprint = 1'b0;
	 end
	endcase
end

endmodule