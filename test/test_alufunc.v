`ifndef _test_alufunc
`define _test_alufunc

`timescale 1ns / 1ps

`include "../src/alufunc.v"

module test_alufunc;
    reg	[5:0] E_func = 0;
	reg	[5:0] E_op = 0;
	wire [5:0]	e_alufunc;

	parameter stop_time = 60;

    alufunc ALUFUNC(e_alufunc, E_op, E_func);

	initial #stop_time $finish;

    initial begin
		#10;
        E_func = 6'b100000;
        #10;
        E_func = 6'b100010;
        #10;
        E_func = 6'b100010;        
        #10;
        E_func = 6'b100010;        
        #10;
        E_func = 6'b100010;        
        #10;
	end

	initial begin
	  	$monitor("time = ", $time, "op=%b func=%b efunc=%b", E_op, E_func, e_alufunc);
	end

endmodule

`endif
