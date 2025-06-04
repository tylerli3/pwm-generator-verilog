# pwm-generator-verilog

This is a simple 8-bit Pulse Width Modulation (PWM) generator module written in Verilog, along with a testbench for simulation.

## Features
- **8-bit Duty Cycle Resolution** — Provides 256 discrete levels of output pulse width.
- **Synchronous Operation** — Clocked by a system clock with asynchronous reset support.
- **Invert Output Option** — Supports signal inversion to flip active-high/low behavior.
- **Enable Control** — Clean output disable capability.
- **100% Duty Cycle Handling** — Explicitly managed edge case.
- **Designed for Simulation** — Includes full testbench with 10 functional test cases.

## Files
- `src/pwm.v`: Main Verilog module
- `tb/pwm_tb.v`: Testbench to verify functionality

## How to Simulate
Use ModelSim or any Verilog simulator:

```sh
vlog src/pwm.v tb/pwm_tb.v
vsim pwm_tb
```
This project was tested using Intel Quartus Prime Lite 24.1 and ModelSim-Intel Starter Edition
