`ifndef _test_D_reg
`define _test_D_reg

`timescale 1ns / 1ps

`include "../src/def.v"

`include "../src/D_reg.v"

module test_D_reg;
    reg clk = 0;
    reg D_stall = 0;
    reg [5:0] f_op = 0;
    reg [5:0] f_func = 0;
    reg [4:0] f_rs = 0;
    reg [4:0] f_rt = 0;
    reg [4:0] f_rd = 0;
    reg [31:0] f_valC = 0;
    wire [5:0] D_op;
    wire [5:0] D_func;
    wire [4:0] D_rs;
    wire [4:0] D_rt;
    wire [4:0] D_rd;
    wire [31:0] D_valC;

    parameter stop_time = 100;

    D_reg DREG(D_op, D_func, D_rs, D_rt, D_rd, D_valC, clk, D_stall, f_op, f_func, f_rs, f_rd, f_rt, f_valC);

    initial #stop_time $finish;

    initial begin
        #10;
        f_op = `IROP;
        f_func = 6'b100111;
        f_rs = 5'b10011;
        f_rt = 5'b11110;
        f_rd = 5'b11101;
        f_valC = 66;
        #20;
        D_stall = 1;
        f_op = `IROP;
        f_func = 6'b100100;
        f_rs = 5'b10010;
        f_rt = 5'b10110;
        f_rd = 5'b10101;
        f_valC = 77;
        #20;
        D_stall = 0;
        #20;
        D_stall = 0;        
        f_op = `IORI;
        f_func = 6'b100000;
        f_rs = 5'b10111;
        f_rt = 5'b10000;
        f_rd = 5'b10100;
        f_valC = 88;
        #20;
        D_stall = 1;
        f_valC = 99;
        #20;
    end

    initial begin
        repeat(10)
            #10 clk = ~clk;
    end

    initial begin
      	$monitor("time = ", $time, " op=%b func=%b rs=%d rt=%d rd=%d valC=%d", D_op, D_func, D_rs, D_rt, D_rd, D_valC);
    end

endmodule

`endif
