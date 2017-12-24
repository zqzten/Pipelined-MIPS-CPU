`ifndef _test_dstE
`define _test_dstE

`timescale 1ns / 1ps

`include "../src/dstE.v"

module test_dstE;
    reg	[5:0] D_op = 0;
	reg [4:0] D_rt = 0;
    reg [4:0] D_rd = 0;
    wire [4:0]	d_dstE;
    parameter stop_time = 80;

    dstE DSTE(d_dstE, D_op, D_rt, D_rd);

    initial #stop_time $finish;

    initial begin
		$dumpfile("./logs/test_dstE.vcd");
		$dumpvars();
        D_rt=6'b100000;
        D_rd=6'b100001;
        #10;
        D_op = `IROP;
        D_rt = 6'b101000;
        D_rd = 6'b101001;                        
        #10;
        D_op = `IADDI;
        D_rt = 6'b101010;
        D_rd = 6'b101011;
        #10;
        D_op = `IANDI;
        D_rt = 6'b100000;
        D_rd = 6'b100001;
        #10;
        D_op = `ISW;
        D_rt = 6'b100001;
        D_rd = 6'b100000;
        #10;
        D_op = `ILW;
        D_rt = 6'b100011;
        D_rd = 6'b100100;
        #10;
        D_op = `IORI;
        D_rt = 6'b100001;
        D_rd = 6'b100011;
        #10;
    end

    initial begin
        $monitor("time = ", $time, " op=%b rt=%d rd=%d dstE=%d", D_op, D_rt, D_rd, d_dstE);
    end
endmodule

`endif
