#!/bin/bash

# Compile the Verilog design and testbench
echo "Compiling Verilog files..."

iverilog -o life_sim life.v life_fsm_tb.v

# Run the simulation
echo "Running simulation..."

vvp life_sim
