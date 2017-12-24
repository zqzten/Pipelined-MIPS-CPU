`ifndef _reg_file
`define _reg_file

`include "../src/def.v"

module reg_file(
    output reg [31:0] d_rvalA,
    output reg [31:0] d_rvalB,
    input clk,
    input [4:0] d_srcA,
    input [4:0] d_srcB,
    input [4:0] W_dstM,
    input [4:0] W_dstE,
    input [31:0] W_valM,
    input [31:0] W_valE
);

    reg[31:0] regs[0:15];
    /* initial reg */
    initial begin
        regs[0] <= 32'b0;
        regs[1] <= 32'b0;
        regs[2] <= 32'b0;
        regs[3] <= 32'b0;
        regs[4] <= 32'b0;
        regs[5] <= 32'b0;
        regs[6] <= 32'b0;
        regs[7] <= 32'b0;
        regs[8] <= 32'b0;
        regs[9] <= 32'b0;
        regs[10] <= 32'b0;
        regs[11] <= 32'b0;
        regs[12] <= 32'b0;
        regs[13] <= 32'b0;
        regs[14] <= 32'b0;
        regs[15] <= 32'b0;

        d_rvalA = 0;
        d_rvalB = 0;
    end

    /* write value */
    always @(negedge clk) begin
        if (W_dstE != `RNONE && W_dstE) begin
            regs[W_dstE] <= W_valE;
        end
        if (W_dstM != `RNONE && W_dstM) begin
            regs[W_dstM] <= W_valM;      
        end
        
        $display("dstE: %b, valE: %h", W_dstE, W_valE);
        $display("dstM: %b, dstM: %h", W_dstM, W_valM);        
        
        $display("regs[0]: %x", regs[0]);
        $display("regs[1]: %x", regs[1]);
        $display("regs[2]: %x", regs[2]);
        $display("regs[3]: %x", regs[3]);
        $display("regs[4]: %x", regs[4]);
        $display("regs[5]: %x", regs[5]);
        $display("regs[6]: %x", regs[6]);
        $display("regs[7]: %x", regs[7]);
        $display("regs[8]: %x", regs[8]);
        $display("regs[9]: %x", regs[9]);
        $display("regs[10]: %x", regs[10]);
        $display("regs[11]: %x", regs[11]);
        $display("regs[12]: %x", regs[12]);
        $display("regs[13]: %x", regs[13]);
        $display("regs[14]: %x", regs[14]);
        $display("regs[15]: %x", regs[15]);
        
    end

    /* read value */
    always @(d_srcA, d_srcB) begin
        if (d_srcA!=`RNONE) begin
             d_rvalA <= regs[d_srcA];         
        end
        if (d_srcB!=`RNONE) begin
            d_rvalB <= regs[d_srcB];  
        end
        $display("srcA: %b, valA: %h", d_srcA, d_rvalA);
        $display("srcB: %b, valB: %h", d_srcB, d_rvalB);
    end

endmodule

`endif
