`ifndef _test_E_reg
`define _test_E_reg

`timescale 1ns / 1ps

`include "../src/E_reg.v"

module test_E_reg;
    reg clk;
    reg E_bubble;
    reg [5:0] D_op;
    reg [5:0] D_func;
    reg [31:0] D_valC;
    reg [31:0] d_valA;
    reg [31:0] d_valB;
    reg [4:0] d_dstE;
    reg [4:0] d_dstM;
    reg [4:0] d_srcA;
    reg [4:0] d_srcB;
    wire [5:0] E_op;
    wire [5:0] E_func;
    wire [31:0] E_valC;
    wire [31:0] E_valA;
    wire [31:0] E_valB;
    wire [4:0] E_dstE;
    wire [4:0] E_dstM;
    wire [4:0] E_srcA;
    wire [4:0] E_srcB;

    parameter stop_time = 80;

    E_reg E_REG(E_op, E_func, E_valC, E_valA, E_valB, E_dstE, E_dstM, E_srcA, E_srcB, clk, E_bubble, D_op, D_func, D_valC, d_valA, d_valB, d_dstE, d_dstM, d_srcA, d_srcB);

    initial #stop_time $finish;

    initial begin
        E_bubble = 0;
        clk = 0;
        #10;
        D_op = 6'b000001;
        D_func = 6'b000001;
        D_valC = 1;
        d_valA = 1; 
        d_valB = 1;
        d_dstE = 1;
        d_dstM = 1;
        d_srcA = 1;
        d_srcB = 1;
        #10;
        D_op = 6'b000010;
        D_func = 6'b000010;
        D_valC = 2;
        d_valA = 2; 
        d_valB = 2;
        d_dstE = 2;
        d_dstM = 2;
        d_srcA = 2;
        d_srcB = 2;
        #10;
        D_op = 6'b000011;
        D_func = 6'b000011;
        D_valC = 3;
        d_valA = 3; 
        d_valB = 3;
        d_dstE = 3;
        d_dstM = 3;
        d_srcA = 3;
        d_srcB = 3;
        #10;
        E_bubble = 0;
        D_op = 6'b000100;
        D_func = 6'b000100;
        D_valC = 4;
        d_valA = 4; 
        d_valB = 4;
        d_dstE = 4;
        d_dstM = 4;
        d_srcA = 4;
        d_srcB = 4;
        #10;
        D_op = 6'b000101;
        D_func = 6'b000101;
        D_valC = 5;
        d_valA = 5; 
        d_valB = 5;
        d_dstE = 5;
        d_dstM = 5;
        d_srcA = 5;
        d_srcB = 5;
    end

    initial begin
        repeat(8)
            #10 clk=~clk;
    end

    initial begin
        $monitor("time = ", $time, " E_op=%b, E_func=%b, E_valC=%d, E_valA=%d, E_valB=%d, E_dstE=%b, E_dstM=%b, E_srcA=%b, E_srcB=%b", E_op, E_func, E_valC, E_valA, E_valB, E_dstE, E_dstM, E_srcA, E_srcB);
    end
endmodule

`endif
