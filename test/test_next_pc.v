`ifndef _test_next_pc
`define _test_next_pc

`timescale 1ns / 1ps

`include "../src/next_pc.v"

module test_next_pc;
    reg [31:0] F_valP = 0;
    reg [5:0] f_op = 0;
    reg [31:0] f_valC = 0;
    wire [31:0] f_valP;

    parameter stop_time = 80;

    next_pc NEXT_PC(f_valP, F_valP, f_op, f_valC);

	initial #stop_time $finish;    
    
    initial begin
        #10;
        f_op = `IROP;
        F_valP = 0;
        f_valC = 0;
        #10;
        f_op = `IJ;
        F_valP = 4;
        f_valC = 88;
        #10;
        f_op = `ISW;
        F_valP = 88;
        f_valC = 0;
        #10;
        f_op = `IADDI;
        F_valP = 92;
        f_valC = 0;
        #10;
        f_op = `IORI;
        F_valP = 96;
        f_valC = 4;
        #10;
        f_op = `IANDI;
        F_valP = 100;
        f_valC = 8;
        #10;
        f_op = `ISLTI;
        F_valP = 104;
        f_valC = 16;
        #10;
    end

    initial begin
	  	$monitor("time = ", $time, "op=%b F_valP=%x f_valP=%x", f_op, F_valP, f_valP);              
    end
endmodule

`endif
