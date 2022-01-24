	component Lab7 is
		port (
			clk_clk           : in  std_logic                     := 'X';             -- clk
			hex_1_2_export    : out std_logic_vector(13 downto 0);                    -- export
			hex_3_4_export    : out std_logic_vector(13 downto 0);                    -- export
			hex_5_6_export    : out std_logic_vector(13 downto 0);                    -- export
			leds_export       : out std_logic_vector(9 downto 0);                     -- export
			pushbutton_export : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			rooms_hex2        : out std_logic_vector(6 downto 0);                     -- hex2
			rooms_hex1        : out std_logic_vector(6 downto 0);                     -- hex1
			rooms_hex3        : out std_logic_vector(6 downto 0);                     -- hex3
			rooms_leds_out    : out std_logic;                                        -- leds_out
			sw_sliders_export : in  std_logic_vector(9 downto 0)  := (others => 'X')  -- export
		);
	end component Lab7;

	u0 : component Lab7
		port map (
			clk_clk           => CONNECTED_TO_clk_clk,           --        clk.clk
			hex_1_2_export    => CONNECTED_TO_hex_1_2_export,    --    hex_1_2.export
			hex_3_4_export    => CONNECTED_TO_hex_3_4_export,    --    hex_3_4.export
			hex_5_6_export    => CONNECTED_TO_hex_5_6_export,    --    hex_5_6.export
			leds_export       => CONNECTED_TO_leds_export,       --       leds.export
			pushbutton_export => CONNECTED_TO_pushbutton_export, -- pushbutton.export
			rooms_hex2        => CONNECTED_TO_rooms_hex2,        --      rooms.hex2
			rooms_hex1        => CONNECTED_TO_rooms_hex1,        --           .hex1
			rooms_hex3        => CONNECTED_TO_rooms_hex3,        --           .hex3
			rooms_leds_out    => CONNECTED_TO_rooms_leds_out,    --           .leds_out
			sw_sliders_export => CONNECTED_TO_sw_sliders_export  -- sw_sliders.export
		);

