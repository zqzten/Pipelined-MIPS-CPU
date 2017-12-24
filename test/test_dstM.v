`ifndef _test_dstM
`define _test_dstM

`timescale 1ns / 1ps

`include "../src/dstM.v"

module test_dstM;
	reg	[5:0] D_op = 0;
	reg [4:0] D_rt = 0;
    wire [4:0]	d_dstM;

    parameter stop_time = 80;

    dstM DSTM(d_dstM, D_op, D_rt);

    initial #stop_time $finish;

    initial begin
		$dumpfile("./logs/test_dstM.vcd");
		$dumpvars();
        D_rt=6'b100000;
        #10;
        D_op = `ISW;
        D_rt = 6'b101101;        
        #10;
        D_op = `IADDI;
        D_rt = 6'b101111;
        #10;
        D_op = `ILW;
        D_rt = 6'b100000;
        #10;
        D_rt = 6'b100001;
        #10;
        D_op = `IROP;
        D_rt = 6'b100011;
        #10;
        D_rt = 6'b100101;
        #10;
        D_op = `ILW;             
        #10;
    end

    initial begin
        $monitor("time = ", $time, " op=%b rt=%d dstM=%d", D_op, D_rt, d_dstM);
    end
endmodule

`endif
