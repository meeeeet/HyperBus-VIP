import os
import numpy as np
import cocotb
from cocotb.triggers import Timer, FallingEdge, RisingEdge, ReadOnly, NextTimeStep
from cocotb_bus.drivers import BusDriver
from cocotb_bus.monitors import BusMonitor
from cocotb.clock import Clock
from cocotb.utils import get_sim_time


signals=["i_clk",
"i_rstn",
"i_cfg_access",
"i_mem_valid",
"i_mem_wstrb",
"i_mem_addr",
"i_mem_wdata"
]

@cocotb.test()
async def HyperBus_test(dut):
    print("Initalizing inputs...")
    init(dut)

    c = Clock(dut.i_clk, 10, 'ns')
    await cocotb.start(c.start())

    await Timer(100,'ns')
    assign(dut,'i_rstn',1)

    print("Waiting for device power-up...")
    await Timer(160,'ns')
    print("Reading the ID0...")
    assign(dut,'i_cfg_access',1)
    assign(dut,'i_mem_valid',1)
    assign(dut,'i_mem_wstrb',0)
    assign(dut,'i_mem_addr',0)

    await Timer(10,'ns')
    assign(dut,'i_mem_valid',0)

    await is_memready(dut)
    await Timer(100,'ns')
    print(f'ID0: {hex(dut.o_mem_rdata.value)}')    


def init(dut):
    for _signal in signals:
        assign(dut,_signal,0)

def assign(dut,s_name,s_value):
    exec(f'dut.{s_name}.value={s_value}')


async def is_memready(dut):
    while True:
        await ReadOnly()  # Yield to simulator to get updated signal values
        if dut.o_mem_ready.value == 1:
            print(f"Current simulation time: {get_sim_time(units='ns')}")
            break
        await Timer(1, 'ns')  # Small delay to avoid busy waiting