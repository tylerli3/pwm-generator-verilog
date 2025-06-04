`timescale 1ns / 1ps
module pwm_tb;
reg clk;
reg rst;
reg [7:0] duty_cycle;
reg invert;
reg enable;

wire pwm_out;

pwm uut (
.clk(clk),
.rst(rst),
.duty_cycle(duty_cycle),
.invert(invert),
.enable(enable),
.pwm_out(pwm_out)
);

// clock, 100 MHz, 10ns period
always #5 clk = ~clk;


task reset;
begin
	rst = 1;
	#10;
	rst = 0;
end
endtask

initial begin 
	$error("test2");
	clk = 0;
	rst = 1;
	duty_cycle = 8'd0;
	invert = 0;
	enable = 0;
	
	#20;
	rst = 0; // release reset
	if(pwm_out)
		$error("pwm_out is 1 after reset");
	
	//each test case lasts for 1 cycle (2560 ns) except for case 9, which is 2 cycles
	// test case 1: 25 percent duty
	duty_cycle = 8'd64;
	enable = 1;
	#2560; //full period
	
	// test case 2: 50 percent duty
	reset();
	duty_cycle = 8'd128;
	#2560;
	
	// test case 3: 75 percent duty
	reset();
	duty_cycle = 8'd192;
	#2560;
	
	// test case 4: 100 percent duty
	reset();
	duty_cycle = 8'd255;
	#2560;
	if(~pwm_out)
		$error("pwm_out is 0 on 100 percent duty");
	
	// test case 5: 0 percent duty
	reset();
	duty_cycle = 8'd0;
	#2560;
	if(pwm_out)
		$error("pwm_out is 1 on 0 percent duty");
	
	// test case 6: invert on, 50 percent duty
	reset();
	duty_cycle = 8'd128;
	invert = 1;
	#2560;
	invert = 0;
	
	// test case 7: enable off
	reset();
	duty_cycle = 8'd128;
	enable = 0;
	#2560;
	if(pwm_out)
		$error("pwm_out is 1 with enable off");
	
	// test case 8: counter overflow
	reset();
	duty_cycle = 8'd128;
	enable = 1;
	#5120; // one overflow
	
	// test case 9: count, then reset async
	reset();
	duty_cycle = 8'd128;
	#1505;
	rst = 1;
	#105;
	rst = 0;
	if(pwm_out)
		$error("pwm_out is 1 after async reset");
	#950;
	
	// test case 10: async enable off (pause)
	reset();
	duty_cycle = 8'd128;
	#1005;
	enable = 0;
	#500;
	if(pwm_out)
		$error("pwm_out is 1 after async enable off");
	#1005;
	
	$finish;
end



endmodule