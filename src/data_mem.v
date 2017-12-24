`ifndef _data_mem
`define _data_mem

`include "../src/def.v"

module data_mem(
    output reg [31:0] m_valM,
    input [5:0] M_op,
    input [31:0] M_valE,
    input [31:0] M_valA
);
    parameter DM_DATA="../data/data_memory.txt";
    
    reg[31:0] data[0:63];

    initial begin
		$readmemh(DM_DATA, data, 0, 63);
	end

    always @(*) begin
        if (M_op==`ILW) begin
            m_valM <= data[M_valE[5:0]];
        end else if (M_op==`ISW) begin
            data[M_valE[5:0]] <= M_valA;
        end
    end
endmodule

`endif
