`ifndef _test_data_mem
`define _test_data_mem

`timescale 1ns / 1ps

`include "../src/data_mem.v"

module test_data_mem;
    reg [5:0] M_op;
    reg [31:0] M_valE;
    reg [31:0] M_valA;
    wire [31:0] m_valM;

    parameter stop_time = 100;

    data_mem DATA_MEM(m_valM, M_op, M_valE, M_valA);

    initial #stop_time $finish;

    initial begin
        #10;
        M_op = `ISW;
        M_valE = 1;
        M_valA = 1;
        #10;
        M_op = `ISW;
        M_valE = 2;
        M_valA = 2;
        #10;
        M_op = `ILW;
        M_valE = 2;
        #10;
        M_op = `ILW;
        M_valE = 1;
        #10;
        M_op = `IROP;
        M_valE = 3;
        M_valA = 3;
        #10;
        M_op = `IJ;
        M_valE = 3;
        #10;
    end

    initial begin
        $monitor("time = ", $time, " valM=%x", m_valM);              
    end

endmodule

`endif
