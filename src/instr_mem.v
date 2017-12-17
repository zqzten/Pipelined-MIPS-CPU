`ifndef _instr_mem
`define _instr_mem

module instr_mem(
    output [5:0] f_op,
    output [5:0] f_func,
    output [4:0] f_rs,
    output [4:0] f_rt,
    output [4:0] f_rd,
    output [31:0] f_valC,
    input [31:0] F_valP
);
endmodule

`endif
