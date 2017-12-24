`ifndef _F_reg
`define _F_reg

module F_reg(
    output reg [31:0] F_valP,
    input [31:0] f_valP,
    input clk,
    input F_stall
);  
    initial begin
        F_valP <= 0;
    end 
    
    always @(posedge clk) begin
        if (!F_stall) begin
            $display("PC:%d", f_valP);            
            F_valP <= f_valP;
        end else begin
            $display("nextpc: %d, stop here!", f_valP);
        end
    end

endmodule

`endif
