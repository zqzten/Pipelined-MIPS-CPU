`ifndef _test_reg_file
`define _test_reg_file

`timescale 1ns / 1ps

`include "../src/reg_file.v"

module test_reg_file;
    wire [31:0] d_rvalA;
    wire [31:0] d_rvalB;
    reg clk = 0;
    reg [4:0] d_srcA;
    reg [4:0] d_srcB;
    reg [4:0] W_dstM;
    reg [4:0] W_dstE;
    reg [31:0] W_valM;
    reg [31:0] W_valE;

    parameter stop_time = 50;

    reg_file REG_FILE(d_rvalA, d_rvalB, clk, d_srcA, d_srcB, W_dstM, W_dstE, W_valM, W_valE);

    initial #stop_time $finish;

    initial begin
        clk = 0;
        d_srcA = 0;
        d_srcB = 0;
        #5;
        W_dstE = 1;
        W_dstM = 2;
        W_valE = 1;
        W_valM = 2;
        #5;
        d_srcA = 1;
        d_srcB = 2;
        #5;
        W_dstE = 1;
        W_dstM = 2;
        W_valE = 3;
        W_valM = 4;
        #5;
        d_srcA = 0;
        d_srcB = 0;
        #5;
        W_dstE = 0;
        W_valE = 5;
        #5;
        d_srcA = 2;
        d_srcB = 1;
        #5;
    end

    initial begin
        repeat(10)
            #5 clk=~clk;      
    end

    initial begin
        $monitor("time = ", $time, " srcA=%d srcB=%d valA=%d valB=%d", d_srcA, d_srcB, d_rvalA, d_rvalB);
    end
endmodule

`endif
