# 8-bit-harvard-processor
verilog hdl design of a 8 bit harvard processor

main8.v is the final main module of the processor
main8_tb.v is test bench of processor,you can change the clock and reset line according to your need
main8 is the executive file i compiled

for every submodule of this processor there is a file prefixed with "_tb.v" which is a test bench to check that particular module
The complete features and functions of this processor are listed in scheme.txt and 8 Bit Harvard Processor.ppt
How to check the output?

  -> You can check the scheme.txt and make your own instruction set
  
  -> Paste them in file named "test.prog" and make all other values to zeroes as shown in the example I have done
  
  -> Change the data memory values according to your need in file named "test.data"
  
  -> Open command prompt
  
  -> Type "cd c:/iverilog/(folder u placed all these files)" and click on Enter --------------eg: cd c:/iverilog/bin/test
  
  -> Type "iverilog -o (any exec name) (testbench name) and click on Enter--------------------eg: iverilog -o main8 main8_tb.v
  
  -> after succesful compilation
  
  -> Type vvp (exec name) and click on Enter--------------------------------------------------eg: vvp main8
  
  -> after execution check the updated register and data memory values in files named "reg_out.o" and "data_out.o"
  
