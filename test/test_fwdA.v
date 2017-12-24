`ifndef _test_fwdA
`define _test_fwdA

`timescale 1ns / 1ps

`include "../src/fwdA.v"

module test_fwdA;
    reg [4:0] d_srcA;
    reg [4:0] E_dstE;
    reg [4:0] M_dstM;
    reg [4:0] M_dstE;
    reg [4:0] W_dstM;
    reg [4:0] W_dstE;
    reg [31:0] d_rvalA;
    reg [31:0] e_valE;
    reg [31:0] m_valM;
    reg [31:0] M_valE;
    reg [31:0] W_valM;
    reg [31:0] W_valE;
    wire [31:0] d_valA;

    parameter stop_time = 80;

    fwdA FWDA(d_valA, d_srcA, E_dstE, M_dstM, M_dstE, W_dstM, W_dstE, d_rvalA, e_valE, m_valM, M_valE, W_valM, W_valE);

    initial #stop_time $finish;

    initial begin
		$dumpfile("./logs/test_fwdA.vcd");
		$dumpvars();
        d_srcA = 0;
        d_rvalA = 0;
        #10;
        d_srcA = `RNONE;
        d_rvalA = 1;
        #10;
        d_srcA = 5'b10101;
        E_dstE = 5'b10101;
        e_valE = 2;
        #10;
        d_srcA = 5'b10110;
        M_dstE = 5'b10110;
        M_valE = 3;
        #10;
        d_srcA = 5'b10111;
        M_dstM = 5'b10111;
        m_valM = 4;
        #10;
        d_srcA = 5'b11000;
        W_dstE = 5'b11000;
        W_valE = 5;
        #10;
        d_srcA = 5'b11001;
        W_dstM = 5'b11001;
        W_valM = 6;
        #10;
        d_srcA = 5'b11010;
        E_dstE = 5'b00001;
        M_dstE = 5'b00010;
        M_dstM = 5'b00011;
        W_dstE = 5'b00100;
        W_dstM = 5'b00101;
        d_rvalA = 7;
        #10;
    end

    initial begin
        $monitor("time = ", $time, " valA=%d, srcA=%b", d_valA, d_srcA);
    end
endmodule

`endif
