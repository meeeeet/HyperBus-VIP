module top;

// Inputs
	input i_clk;
	input i_rstn;
	input i_cfg_access;
	input i_mem_valid;
	input [3:0] i_mem_wstrb;
	input [31:0] i_mem_addr;
	input [31:0] i_mem_wdata;

	// Outputs
	wire o_mem_ready;
	wire [31:0] o_mem_rdata;
	wire o_csn0;
	wire o_csn1;
	wire o_clk;
	wire o_clkn;
	wire o_resetn;

	// Bidirs
	wire [7:0] io_dq;
	wire io_rwds;

hbc_wrapper hbc (
    .i_clk(i_clk),
    .i_rstn(i_rstn), 
    .i_cfg_access(i_cfg_access), 
    .i_mem_valid(i_mem_valid), 
    .o_mem_ready(o_mem_ready), 
    .i_mem_wstrb(i_mem_wstrb), 
    .i_mem_addr(i_mem_addr), 
    .i_mem_wdata(i_mem_wdata), 
    .o_mem_rdata(o_mem_rdata), 
    .o_csn0(o_csn0), 
    .o_csn1(o_csn1), 
    .o_clk(o_clk), 
    .o_clkn(o_clkn), 
    .io_dq(io_dq), 
    .io_rwds(io_rwds), 
    .o_resetn(o_resetn)
    );
	 
s27kl0641 
	#(
	.TimingModel("S27KL0641DABHI000"))
	hyperram (
    .DQ7(io_dq[7]), 
    .DQ6(io_dq[6]), 
    .DQ5(io_dq[5]), 
    .DQ4(io_dq[4]), 
    .DQ3(io_dq[3]), 
    .DQ2(io_dq[2]), 
    .DQ1(io_dq[1]), 
    .DQ0(io_dq[0]), 
    .RWDS(io_rwds), 
    .CSNeg(o_csn0), 
    .CK(o_clk), 
    .RESETNeg(o_resetn)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end

endmodule