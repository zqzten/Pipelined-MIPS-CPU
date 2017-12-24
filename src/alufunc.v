`ifndef _alufunc
`define _alufunc

module alufunc(
    output [5:0] e_alufunc,
    input [5:0] E_op,
    input [5:0] E_func
);
    
    assign e_alufunc = E_func;

endmodule

`endif
