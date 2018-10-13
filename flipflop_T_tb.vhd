library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flipflop_T_tb is
end entity;

architecture a_flipflop_T_tb of flipflop_T_tb is
	
component flipflop_T 
    port( clk: in std_logic;
		  rst: in std_logic;
		  wr_en: in std_logic;
		  data_out: out std_logic
		);
    end component;

    signal dado_o, wr_en, rst, clk: std_logic;

    begin 

    flipflop: flipflop_T port map ( clk => clk,
		   					   		rst => rst, 
							   		wr_en => wr_en,
							   		data_out => dado_o 
								  );

	process
	begin
	clk <= '0';
    wait for 50 ns;
    clk <= '1';
    wait for 50 ns;
    end process;

    process
	begin
	rst <= '1';
	wait for 10 ns;
	rst <= '0';
	wr_en <= '1';
	wait for 190 ns;
	wr_en <= '0';
	wait for 100 ns;
	wr_en <= '1';
	rst <= '1';
	wait for 100 ns;
	rst <= '0';
	wait;
	end process;

end architecture;