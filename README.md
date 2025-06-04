# pwm-generator-verilog

This is a simple 8-bit Pulse Width Modulation (PWM) generator module written in Verilog, along with a testbench for simulation.

## Features
- Parameterized 8-bit duty cycle
- Invert output option
- Enable control signal
- Handles edge cases like 0% and 100% duty
- Synchronous counter with async reset

## Files
- `src/pwm.v`: Main Verilog module
- `tb/pwm_tb.v`: Testbench to verify functionality

## How to Simulate
Use ModelSim or any Verilog simulator:

```sh
vlog src/pwm.v tb/pwm_tb.v
vsim pwm_tb
