`ifndef _test_aluA
`define _test_aluA

`timescale 1ns / 1ps

`include "../src/aluA.v"

module test_aluA;
    reg	[31:0]	E_valA = 0;
	reg	[31:0]	E_valC = 0;
	reg	[5:0] E_op = 0;
	wire [31:0]	e_aluA;

	parameter stop_time = 80;

    aluA ALUA(e_aluA, E_op, E_valC, E_valA);

	initial #stop_time $finish;

    initial begin
		$dumpfile("./logs/test_aluA.vcd");
		$dumpvars();
		E_valA = 32'd35;
		E_valC = 32'd17;
		#10;
		E_op = `IROP;
		#10;
		E_op = `IADDI;
		#10;
		E_op = `IANDI;
		#10;
		E_op = `IORI;
		#10;
		E_op = `ISW;
		#10;
        E_op = `ILW;
		#10;
		E_op = `IJ;
		#10;
	end

	initial begin
	  	$monitor("time = ", $time, " op=%x A=%x C=%x aluA=%x", E_op, E_valA, E_valC, e_aluA);
	end
endmodule

`endif
