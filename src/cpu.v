`ifndef _cpu
`define _cpu

`include "../src/pipeline_control.v"

`include "../src/F_reg.v"
`include "../src/instr_mem.v"
`include "../src/next_pc.v"

`include "../src/D_reg.v"
`include "../src/dstE.v"
`include "../src/dstM.v"
`include "../src/srcA.v"
`include "../src/srcB.v"
`include "../src/reg_file.v"
`include "../src/fwdA.v"
`include "../src/fwdB.v"

`include "../src/E_reg.v"
`include "../src/aluA.v"
`include "../src/aluB.v"
`include "../src/alufunc.v"
`include "../src/alu.v"

`include "../src/M_reg.v"
`include "../src/data_mem.v"

`include "../src/W_reg.v"

module cpu(
    input clk
);
wire F_stall;
wire D_stall;
wire E_bubble;

wire [31:0] F_valP;

wire [5:0] f_op;
wire [5:0] f_func;
wire [4:0] f_rs;
wire [4:0] f_rt;
wire [4:0] f_rd;
wire [31:0] f_valC;
wire [31:0] f_valP;

wire [5:0] D_op;
wire [5:0] D_func;
wire [4:0] D_rs;
wire [4:0] D_rt;
wire [4:0] D_rd;
wire [31:0] D_valC;

wire [31:0] d_valA;
wire [31:0] d_valB;
wire [31:0] d_rvalA;
wire [31:0] d_rvalB;
wire [4:0] d_dstE;
wire [4:0] d_dstM;
wire [4:0] d_srcA;
wire [4:0] d_srcB;

wire [5:0] E_op;
wire [5:0] E_func;
wire [31:0] E_valC;
wire [31:0] E_valA;
wire [31:0] E_valB;
wire [4:0] E_dstE;
wire [4:0] E_dstM;
wire [4:0] E_srcA;
wire [4:0] E_srcB;

wire [31:0] e_aluA;
wire [31:0] e_aluB;
wire [5:0] e_alufunc;
wire [31:0] e_valE;

wire [5:0] M_op;
wire [31:0] M_valE;
wire [31:0] M_valA;
wire [4:0] M_dstE;
wire [4:0] M_dstM;

wire [31:0] m_valM;

wire [31:0] W_valE;
wire [31:0] W_valM;
wire [4:0] W_dstE;
wire [4:0] W_dstM;

pipeline_control PIPELINE_CONTROL(F_stall, D_stall, E_bubble, E_op, E_dstM);

/* fetch */
F_reg F_REG(F_valP, f_valP, clk, F_stall);
instr_mem INSTR_MEM(f_op, f_func, f_rs, f_rt, f_rd, f_valC, F_valP);
next_pc NEXT_PC(f_valP, F_valP, f_op, f_valC);

/* decode */
D_reg D_REG(D_op, D_func, D_rs, D_rt, D_rd, D_valC, clk, D_stall, f_op, f_func, f_rs, f_rd, f_rt, f_valC);
dstE DSTE(d_dstE, D_op, D_rt, D_rd);
dstM DSTM(d_dstM, D_op, D_rt);
srcA SRCA(d_srcA, D_op, D_rt);
srcB SRCB(d_srcB, D_op, D_rs);
reg_file REG_FILE(d_rvalA, d_rvalB, clk, d_srcA, d_srcB, W_dstM, W_dstE, W_valM, W_valE);
fwdA FWDA(d_valA, d_srcA, E_dstE, M_dstM, M_dstE, W_dstM, W_dstE, d_rvalA, e_valE, m_valM, M_valE, W_valM, W_valE);
fwdB FWDB(d_valB, d_srcB, E_dstE, M_dstM, M_dstE, W_dstM, W_dstE, d_rvalB, e_valE, m_valM, M_valE, W_valM, W_valE);

/* execute */
E_reg E_REG(E_op, E_func, E_valC, E_valA, E_valB, E_dstE, E_dstM, E_srcA, E_srcB, clk, E_bubble, D_op, D_func, D_valC, d_valA, d_valB, d_dstE, d_dstM, d_srcA, d_srcB);
aluA ALUA(e_aluA, E_op, E_valC, E_valA);
aluB ALUB(e_aluB, E_op, E_valB);
alufunc ALUFUNC(e_alufunc, E_op, E_func);
alu ALU(e_valE, e_aluA, e_aluB, e_alufunc);

/* memory */
M_reg M_REG(M_op, M_valE, M_valA, M_dstE, M_dstM, clk, E_op, e_valE, E_valA, E_dstE, E_dstM);
data_mem DATA_MEM(m_valM, M_op, M_valE, M_valA);

/* write back */
W_reg W_REG(W_valE, W_valM, W_dstE, W_dstM, clk, M_valE, m_valM, M_dstE, M_dstM);

endmodule

`endif
