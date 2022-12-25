`include "defines.v"

module SCU(
    input   wire                cpu_rst_n,
    input   wire                stallreq_if,
    input   wire                stallreq_mem,
    input   wire                stallreq_id,
    input   wire                stallreq_exe,
    output  wire[`STALL_BUS]    stall
    );
    
    assign stall = (cpu_rst_n == `RST_ENABLE) ? 5'b00000 :
                   (stallreq_mem == `STOP) ? 5'b11111 :
                   (stallreq_exe == `STOP) ? 5'b01111 :
                   (stallreq_id == `STOP) ? 5'b00111 : 
                   (stallreq_if == `STOP) ? 5'b00011 : 5'b00000;
                   
                        
endmodule
