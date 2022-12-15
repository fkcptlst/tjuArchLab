`include "defines.v"

module SCU(
    input   wire                cpu_rst_n,
    input   wire                stallreq_id,
    input   wire                stallreq_exe,
    output  wire[`STALL_BUS]    stall
    );
    // Stall Control Unit
    
    assign stall = (cpu_rst_n == `RST_ENABLE) ? 4'b0000 :
                        (stallreq_exe == `STOP) ? 4'b1111 :
                        (stallreq_id == `STOP) ? 4'b0111 : 4'b0000;
                        
endmodule
