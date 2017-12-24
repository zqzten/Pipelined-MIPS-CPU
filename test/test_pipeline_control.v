`ifndef _test_pipeline_control
`define _test_pipeline_control

`timescale 1ns / 1ps

`include "../src/pipeline_control.v"

module test_pipeline_control;
    reg [5:0] E_op = 0;
    reg [4:0] E_dstM = 0;
    wire F_stall;
    wire D_stall;
    wire E_bubble;

    parameter stop_time = 70;

    pipeline_control PIPELINECONTROL(F_stall, D_stall, E_bubble, E_op, E_dstM);

    initial begin
        #10;
        E_op = `IJ;
        E_dstM = `RNONE;
        #10;
        E_op = `IADDI;
        E_dstM = 5'b00100;
        #10;
        E_op = `IROP;
        E_dstM = 5'b00101;
        #10;
        E_op = `ILW;
        E_dstM = 5'b00111;
        #10;
        E_op = `ISW;
        E_dstM = 5'b00110;
        #10;
        E_op = `ILW;
        E_dstM = `RNONE;
        #10;
        E_op = `ILW;
        E_dstM = 5'b01011;
        #10;
    end

    initial begin
        $monitor("time = ", $time, "op=%b dstM=%x F_stall=%b D_stall=%b E_bubble=%b", E_op, E_dstM, F_stall, D_stall, E_bubble);
    end
endmodule

`endif
