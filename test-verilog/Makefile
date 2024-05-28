VERILOG_SOURCES += hbc_tb.v
VERILOG_SOURCES += ../rtl/HyperBus_ctrl/hbc.v
VERILOG_SOURCES += ../rtl/HyperBus_ctrl/hbc_io.v
VERILOG_SOURCES += ../rtl/HyperBus_ctrl/hbc_wrapper.v
VERILOG_SOURCES += ../rtl/HyperRAM/s27kl0641.v

all: verilog_tb
verilog_tb: clean
	@echo "Starting verilog testbench..."
	@iverilog $(VERILOG_SOURCES)
	@vvp a.out

wave:
	@echo "Opening waveforms..."
	@gtkwave *.vcd *.gtkw
	
clean:
	@echo "Cleaning..."
	@rm -f *.vcd
	@rm -f *.out
