`include "main8.v"

module main8_tb;

reg clk,reset;
wire[7:0] o1,o2;
main8 mmm(clk,reset);

always
begin

#1 clk= ~clk;
end

initial begin

$dumpfile("main.vcd");
$dumpvars(0,clk,reset);
reset=1;clk=0;
#1 reset = 1'b0;
#127 reset = 1'b1;
#1 $finish;
end 

initial
$monitor("time=%d,clk=%d,rst=%d",$time,clk,reset);
endmodule