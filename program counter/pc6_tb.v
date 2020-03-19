`include "pc6.v"
module pc6_tb;
reg clk,reset;
wire[5:0] q;

pc6 rrrr(clk,reset,q);
initial begin

clk=0;
forever #1 clk= ~clk;
end
initial begin
reset=1;
#20 reset = 1'b0;
#200 reset = 1'b1;
#20 $finish;

end 
initial
$monitor($time,"clk=%d,reset=%d,q=%d",clk,reset,q);
endmodule