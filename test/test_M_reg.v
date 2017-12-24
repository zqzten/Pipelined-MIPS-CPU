`ifndef _test_M_reg
`define _test_M_reg

`timescale 1ns / 1ps

`include "../src/M_reg.v"

module test_M_reg;
    reg clk;
    reg [5:0] E_op;
    reg [31:0] e_valE;
    reg [31:0] E_valA;
    reg [4:0] E_dstE;
    reg [4:0] E_dstM;
    wire [5:0] M_op;
    wire [31:0] M_valE;
    wire [31:0] M_valA;
    wire [4:0] M_dstE;
    wire [4:0] M_dstM;

    parameter stop_time = 70;

    M_reg M_REG(M_op, M_valE, M_valA, M_dstE, M_dstM, clk, E_op, e_valE, E_valA, E_dstE, E_dstM);

    initial #stop_time $finish;

    initial begin
		$dumpfile("./logs/test_M_reg.vcd");
		$dumpvars();
        clk = 0;
        #10;
        E_op = `IROP;
        e_valE = 1;
        E_valA = 1;
        E_dstE = 1;
        E_dstM = 1;
        #10;
        E_op = `IANDI;
        e_valE = 2;
        E_valA = 2;
        E_dstE = 2;
        E_dstM = 2;
        #10;
        E_op = `IADDI;
        e_valE = 3;
        E_valA = 3;
        E_dstE = 3;
        E_dstM = 3;
        #10;
        E_op = `IJ;
        e_valE = 4;
        E_valA = 4;
        E_dstE = 4;
        E_dstM = 4;
        #10;
        E_op = `ILW;
        e_valE = 5;
        E_valA = 5;
        E_dstE = 5;
        E_dstM = 5;
        #10;
        E_op = `ISW;
        e_valE = 6;
        E_valA = 6;
        E_dstE = 6;
        E_dstM = 6;
        #10; 
        E_op = `IORI;
        e_valE = 7;
        E_valA = 7;
        E_dstE = 7;
        E_dstM = 7;
    end

    initial begin
        repeat(7)
            #10 clk=~clk;
    end

    initial begin
        $monitor("time = ", $time, " M_op=%b M_valE=%x M_valA=%x M_dstE=%x M_dstM=%x", M_op, M_valE,  M_valA, M_dstE, M_dstM);
    end
endmodule

`endif
