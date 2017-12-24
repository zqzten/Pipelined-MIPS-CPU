`ifndef _test_aluB
`define _test_aluB

`timescale 1ns / 1ps

`include "../src/aluB.v"

module test_aluB;
    reg	[31:0]	E_valB = 0;
	reg	[5:0] E_op = 0;
	wire [31:0]	e_aluB;

	parameter stop_time = 80;

    aluB ALUB(e_aluB, E_op, E_valB);

	initial #stop_time $finish;

    initial begin
		$dumpfile("./logs/test_aluB.vcd");
		$dumpvars();
		E_valB = 32'd35;
		#10;
		E_op = `IROP;
		#10;
		E_op = `IADDI;
		#10;
		E_op = `IJ;
        E_valB = 32'd77;
		#10;
		E_op = `IORI;        
		#10;
		E_op = `ISW;
        E_valB = 32'd88;        
		#10;
        E_op = `ILW;
		#10;
		E_op = `IJ;
		#10;
	end

	initial begin
	  	$monitor("time = ", $time, " op=%x B=%x aluB=%x", E_op, E_valB, e_aluB);
	end
endmodule

`endif
