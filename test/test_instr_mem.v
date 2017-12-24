`ifndef _test_instr_mem
`define _test_instr_mem

`timescale 1ns / 1ps

`include "../src/instr_mem.v"

module test_instr_mem;
    reg [31:0] F_valP = 0;
    wire [5:0] f_op;
    wire [5:0] f_func;
    wire [4:0] f_rs;
    wire [4:0] f_rt;
    wire [4:0] f_rd;
    wire [31:0] f_valC;

    parameter stop_time = 70;

    initial #stop_time $finish;

    instr_mem IM(f_op, f_func, f_rs, f_rt, f_rd, f_valC, F_valP);

    initial begin
        #5  F_valP = 4;
        #5  F_valP = 8;
        #5  F_valP = 12;
        #5  F_valP = 20;
        #5  F_valP = 24;
        #5  F_valP = 28;
        #5  F_valP = 32;
        #5  F_valP = 40;
        #5  F_valP = 44;
        #5  F_valP = 48;
        #5  F_valP = 52;
        #5  F_valP = 60;
    end

    initial begin
        $monitor("time = ", $time, " op=%b func=%b rs=%d rt=%d rd=%d valC=%x", f_op, f_func, f_rs, f_rt, f_rd, f_valC);              
    end
endmodule

`endif
