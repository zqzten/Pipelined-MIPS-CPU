`ifndef _pipeline_control
`define _pipeline_control

`include "../src/def.v"

module pipeline_control(
    output reg F_stall,
    output reg D_stall,
    output reg E_bubble,
    input [5:0] E_op,
    input [4:0] E_dstM
);

    initial begin
        F_stall <= 0;
        D_stall <= 0;
        E_bubble <= 0;
    end

    always @(*) begin
        if (E_dstM!=`RNONE && E_op==`ILW) begin
            F_stall <= 1;
            D_stall <= 1;
            E_bubble <= 1;
            $display("need to stop a clk");
        end else begin
            F_stall <= 0;        
            D_stall <= 0;        
            E_bubble <= 0;
        end
    end

endmodule

`endif
