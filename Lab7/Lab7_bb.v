
module Lab7 (
	clk_clk,
	hex_1_2_export,
	hex_3_4_export,
	hex_5_6_export,
	leds_export,
	pushbutton_export,
	rooms_hex2,
	rooms_hex1,
	rooms_hex3,
	rooms_leds_out,
	sw_sliders_export);	

	input		clk_clk;
	output	[13:0]	hex_1_2_export;
	output	[13:0]	hex_3_4_export;
	output	[13:0]	hex_5_6_export;
	output	[9:0]	leds_export;
	input	[3:0]	pushbutton_export;
	output	[6:0]	rooms_hex2;
	output	[6:0]	rooms_hex1;
	output	[6:0]	rooms_hex3;
	output		rooms_leds_out;
	input	[9:0]	sw_sliders_export;
endmodule
