`ifndef _test_cpu
`define _test_cpu

`timescale 1ns / 1ps

`include "../src/cpu.v"

module test_cpu;
    reg clk;
    
    parameter stop_time = 5000;
   
    initial #stop_time $finish;
        
    cpu CPU(clk);
    
    initial begin
        clk = 0;
        repeat(50)
            #100 clk = ~clk;
    end

endmodule

`endif