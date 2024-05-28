# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += dut.v
VERILOG_SOURCES += ../rtl/HyperBus_ctrl/hbc.v
VERILOG_SOURCES += ../rtl/HyperBus_ctrl/hbc_io.v
VERILOG_SOURCES += ../rtl/HyperBus_ctrl/hbc_wrapper.v
VERILOG_SOURCES += ../rtl/HyperRAM/s27kl0641.v
# use VHDL_SOURCES for VHDL files

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = top

# MODULE is the filename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

run:
	$(MAKE) sim

