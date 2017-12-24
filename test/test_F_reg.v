`ifndef _test_F_reg
`define _test_F_reg

`timescale 1ns / 1ps

`include "../src/F_reg.v"

module test_F_reg;
    reg [31:0] f_valP = 0;
    reg clk = 0;
    reg F_stall = 0;
    wire [31:0] F_valP;

    parameter stop_time = 80;

    F_reg FREG(F_valP, f_valP, clk, F_stall);

    initial #stop_time $finish;
    
    initial begin
        #10;
        f_valP = 4;
        #10;
        f_valP = 8;
        #10;
        F_stall = 1;
        f_valP = 12;
        #10;
        f_valP = 16;
        #10;
        f_valP = 20;
        #10;
        F_stall = 0;
        f_valP = 24;
        #10;
        f_valP = 28;
        #10;
    end

    initial begin
        repeat(8)
            #10 clk = ~clk;
    end

    initial begin
        $monitor("time = ", $time, "F_ValP=%d, F_stall=%d, f_valP=%d", F_valP, F_stall, f_valP);
    end

endmodule

`endif
