`ifndef _test_srcA
`define _test_srcA

`timescale 1ns / 1ps

`include "../src/srcA.v"

module test_srcA;
    reg [5:0] D_op = 0;
    reg [4:0] D_rt = 0;
    wire [4:0] d_srcA;

    parameter stop_time = 80;

    srcA SRCA(d_srcA, D_op, D_rt);

	initial #stop_time $finish;    
    
    initial begin
        #10;
        D_op = `IROP;
        D_rt = 5'b10011;
        #10;
        D_op = `IJ;
        D_rt = 5'b10000;
        #10;
        D_op = `ISW;
        #10;
        D_rt = 5'b10010;
        #10;
        D_op = `IROP;
        D_rt = 5'b01011;
        #10;
    end

    initial begin
	  	$monitor("time = ", $time, " op=%b rt=%d srcA=%d", D_op, D_rt, d_srcA);              
    end
endmodule

`endif
