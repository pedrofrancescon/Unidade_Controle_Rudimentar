library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity pc_rom_tb is
end entity;

architecture a_pc_rom_tb of pc_rom_tb is

	component pc_rom
    	port( clk: in std_logic;
		  	  rst: in std_logic;
		  	  wr_en: in std_logic;
		  	  data_out: out unsigned(31 downto 0)
			);
   	end component;

    signal data_out: unsigned(31 downto 0);
    signal clk, rst, wr_en: std_logic;

    begin 

    	borboleta: pc_rom port map ( clk => clk,
		   					 	 	 rst => rst, 
							 	 	 wr_en => wr_en,
							 	 	 data_out => data_out
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
	wr_en <= '1';
	wait for 10 ns;
	rst <= '0';
	wait;
	end process;

    	

end architecture;