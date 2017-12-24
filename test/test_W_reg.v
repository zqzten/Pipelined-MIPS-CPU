`ifndef _test_W_reg
`define _test_W_reg

`timescale 1ns / 1ps

`include "../src/W_reg.v"

module test_W_reg;
    reg clk = 0;
    reg [31:0] M_valE = 0;
    reg [31:0] m_valM = 0;
    reg [4:0] M_dstE = 0;
    reg [4:0] M_dstM = 0;
    wire [31:0] W_valE;
    wire [31:0] W_valM;
    wire [4:0] W_dstE;
    wire [4:0] W_dstM;

    parameter stop_time = 70;

    W_reg WREG(W_valE, W_valM, W_dstE, W_dstM, clk, M_valE, m_valM, M_dstE, M_dstM);

    initial #stop_time $finish;

    initial begin
		$dumpfile("./logs/test_W_reg.vcd");
		$dumpvars();
        #10;
        M_valE = 1;
        m_valM = 1;
        M_dstE = 1;
        M_dstM = 1;
        #10;
        M_valE = 2;
        m_valM = 2;
        M_dstE = 2;
        M_dstM = 2;
        #10;
        M_valE = 3;
        m_valM = 3;
        M_dstE = 3;
        M_dstM = 3;
        #10;
        M_valE = 4;
        m_valM = 4;
        M_dstE = 4;
        M_dstM = 4;
        #10;
        M_valE = 5;
        m_valM = 5;
        M_dstE = 5;
        M_dstM = 5; 
        #10;
        M_valE = 6;
        m_valM = 6;
        M_dstE = 6;
        M_dstM = 6;
        #10;
        M_valE = 7;
        m_valM = 7;
        M_dstE = 7;
        M_dstM = 7;
    end

    initial begin
        repeat(7)
            #10 clk=~clk;
    end

    initial begin
        $monitor("time = ", $time, " W_valE=%x W_valM=%x W_dstE=%x W_dstM=%x", W_valE, W_valM, W_dstE, W_dstM);
    end

endmodule

`endif
