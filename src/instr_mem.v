`ifndef _instr_mem
`define _instr_mem

`include "../src/def.v"

module instr_mem(
    output reg [5:0] f_op,
    output reg [5:0] f_func,
    output reg [4:0] f_rs,
    output reg [4:0] f_rt,
    output reg [4:0] f_rd,
    output reg [31:0] f_valC,
    input [31:0] F_valP
);

    parameter IM_DATA="../data/instr_memory.txt";

    reg [31:0] insts[15:0];
    reg [31:0] inst;

    initial begin
		$readmemh(IM_DATA, insts, 0, 15);
		$display("time: ", $time);
		$display("0x00, %h", insts[0]);
        $display("0x01, %h", insts[1]);
        $display("0x02, %h", insts[2]);
        $display("0x03, %h", insts[3]);
        $display("0x04, %h", insts[4]);
        $display("0x05, %h", insts[5]);
        $display("0x06, %h", insts[6]);
        $display("0x07, %h", insts[7]);
        $display("0x08, %h", insts[8]);
        $display("0x09, %h", insts[9]);
        $display("0x0a, %h", insts[10]);
        $display("0x0b, %h", insts[11]);
        $display("0x0c, %h", insts[12]);
        $display("0x0d, %h", insts[13]);
        $display("0x0e, %h", insts[14]);
        $display("0x0f, %h", insts[15]);
	end

    always @(F_valP) begin
        /* instruction */
        inst = insts[F_valP[5:2]];
        $display("inst: %h", inst);
        f_op = inst[31:26];
        if (f_op==`IROP) begin
            f_func = inst[5:0];
            f_rs = inst[25:21];
            f_rt = inst[20:16];
            f_rd = inst[15:11];
        end else if (f_op==`ILW || f_op==`ISW || f_op==`IADDI || f_op==`IANDI || f_op==`IORI || f_op==`ISLTI) begin
            f_func = 6'b100000;
            f_rs = inst[25:21];
            f_rt = inst[20:16];
            f_rd = `RNONE;
            if (f_op==`IANDI) begin
                f_func = 6'b100100;
            end else if (f_op==`IROP) begin
                f_func = 6'b100101;
            end else if (f_op==`ISLTI) begin
                f_func = 6'b101010;
            end else begin
                f_func = 6'b100000;
            end
            if (inst[15]) begin
                f_valC = {16'b1111111111111111, inst[15:0]};
            end else begin
                f_valC = {16'b0000000000000000, inst[15:0]};
            end  
        end else if (f_op==`IJ) begin
            f_rs = `RNONE;
            f_rt = `RNONE;
            f_rd = `RNONE;
            f_valC = {6'b000000, inst[25:0]};
        end

    end

endmodule

`endif
