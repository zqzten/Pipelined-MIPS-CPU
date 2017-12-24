`ifndef _test_srcB
`define _test_srcB

`timescale 1ns / 1ps

`include "../src/srcB.v"

module test_srcB;
    reg [5:0] D_op = 0;
    reg [4:0] D_rs = 0;
    wire [4:0] d_srcB;

    parameter stop_time = 80;

    srcB SRCB(d_srcB, D_op, D_rs);

	initial #stop_time $finish;    
    
    initial begin
        #10;
        D_op = `IROP;
        D_rs = 5'b10011;
        #10;
        D_op = `IJ;
        D_rs = 5'b10000;
        #10;
        D_op = `ISW;
        #10;
        D_rs = 5'b10010;
        #10;
        D_op = `IROP;
        D_rs = 5'b01011;
        #10;
    end

    initial begin
	  	$monitor("time = ", $time, " op=%b rs=%d srcB=%d", D_op, D_rs, d_srcB);              
    end
endmodule

`endif
