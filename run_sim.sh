#!/bin/bash

# Compile the Verilog design and testbench
iverilog -o life_sim life.v life_fsm_tb.v

# Run the simulation
vvp life_sim
