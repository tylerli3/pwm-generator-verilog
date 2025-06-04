module pwm(
input clk,
input rst,
input [7:0] duty_cycle, // 0-255 duty cycle input
input invert,
input enable, 
output pwm_out
);

reg [7:0] counter;

always @ (posedge clk or posedge rst) 
begin
	if (rst)
		counter <= 8'd0;
	else if (enable) // pause on enable
		counter <= counter + 8'd1; // set counter based on clk, implicitly wraps at 255
	
end

wire pwm_raw;

assign pwm_raw =	(duty_cycle == 8'd255) ? 1'b1 : // true 100 percent uptime for duty_cycle = 255
						(counter < duty_cycle) ? 1'b1 : 1'b0; 

assign pwm_out = enable ? (invert ? ~pwm_raw : pwm_raw) : 1'b0; // assigns based on enable on/invert on

endmodule

