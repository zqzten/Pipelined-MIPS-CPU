`ifndef _test_alu
`define _test_alu

`timescale 1ns / 1ps

`include "../src/alu.v"

module test_alu;
    reg	[31:0]	valA = 0;
	reg	[31:0]	valB = 0;
	wire [31:0]	valE;
	reg	[5:0] func = 0;

	parameter stop_time = 80;

    alu ALU(valE, valA, valB, func);

	initial #stop_time $finish;
	
    initial begin
		$dumpfile("./logs/test_alu.vcd");
		$dumpvars();
		valA = 32'd0;
		valB = 32'd0;
		func =  6'b100000;
		#10;
		valA = 32'd35;
		valB = 32'd17;
		#10;
		func = 6'b100010;
		#10;
		func = 6'b100100;
		#10;
		func = 6'b100101;
		#10;
		func = 6'b101010;
		#10;
		valA = 32'd14;
		valB = 32'd17;
		#10;
		func = 6'b100010;
		#10;
	end

	initial begin
	  	$monitor("time = ", $time, "A=%x B=%x func=%x E=%x", valA, valB, func, valE);
	end

endmodule

`endif
