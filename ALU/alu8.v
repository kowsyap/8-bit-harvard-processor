`include "rd8.v"  //8 bit adder
`include "wtm8.v" //8 bit multiplicator
`include "nrd8.v" //8 bit divider
`include "bs8.v"  //8 bit barrel shifter
`include "divs.v"
`include "concatenate8.v"
`include "kpg1_8.v"
`include "kpg2_8.v"
`include "kpg3_8.v"
`include "gkconv.v"
`include "xor3.v"
`include "endd.v"
`include "mx4.v"
`include "sel.v"
`include "mux16.v"
`include "concatenate16.v"
`include "kpg1_16.v"
`include "kpg2_16.v"
`include "kpg3_16.v"
`include "kpg4_16.v"
`include "gkconv16.v"
`include "xor3_16.v"
`include "pp8.v"
`include "rd16.v"
`include "fulladder.v"
`include "halfadder.v"
`include "mux4.v" //support modules

module alu8(a,b,opc,op,out,out2,carry);
input[7:0] a,b;
input[3:0] opc;
input[1:0] op;
output reg[7:0] out,out2;
output reg carry;
wire[7:0] sum,diff,quo,rem,lshift,rshift,b2;
wire[15:0] mul;
wire[3:0] sel;
wire c,c1;

//wire [8:0] tmp;
//    assign tmp = {1'b0,a} + {1'b0,b};
//    assign CarryOut = tmp[8]; // Carryout flag

rd8 aa(a,b,sum,c); //addition
assign b2 = ~b+1;
rd8 ss(a,b2,diff,c1);//sub
wtm8 ww(a,b,mul);//mul
nrd8 dd(a,b[6:0],quo,rem);//div
bs8 bb(a,b[2:0],1'b0,lshift);//L.shifter
bs8 bb1(a,b[2:0],1'b1,rshift);//R.shifter


always @(*)
begin
	out2  <=8'd0;
	out   <=8'd0;
	carry <=1'd0;
	if(op==2'b01)
		begin
		case(opc)
			 4'b0000: // Addition
			begin
			   out <= sum; 
			   carry <= c;
			end
			 4'b0001: // Subtraction
			begin
			   out <= diff ;
			   carry <= c1;
			end
			 4'b0010: // Multiplication
			begin
			   out <= mul[7:0] ;
			   out2<= mul[15:8];
			end
			 4'b0011: // Division
			begin   
			   out <= quo ;
			   out2<= rem;
			end
			 4'b0100: // Logical shift left
			   out <= lshift ;
			 4'b0101: // Logical shift right
			   out <= rshift ;
			 4'b0110: // Rotate left
			   out <= {a[6:0],a[7]};
			 4'b0111: // logical not
			   out <= ~a;
			 4'b1000: //  Logical and 
			   out <= a & b;
			 4'b1001: //  Logical or
			   out <= a | b;
			 4'b1010: //  Logical nand
			   out <= ~(a & b);
			 4'b1011: // Logical nor 
			   out <= ~(a | b);
			 4'b1100: //  Logical xor 
			   out <= a ^ b;
			 4'b1101: // Logical xnor
			   out <= ~(a ^ b);
			 4'b1110: // Greater comparison
			   carry <= (a>b)?1'd1:1'd0 ;
			 4'b1111: // Equal comparison   
			   carry <= (a==b)?1'd1:1'd0 ;
			 default: out <= 8'd0 ; 
		endcase
		end
		else if(op==2'b10)
			begin
			out=8'd0;
			out2=8'd0;
			carry=1'd0;
			end
end
endmodule