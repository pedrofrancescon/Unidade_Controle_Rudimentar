library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity pc15bits_tb is
end entity;

architecture a_pc15bits_tb of pc15bits_tb is
	
	component pc15bits
    	port( clk: in std_logic;
		  	rst: in std_logic;
		  	wr_en: in std_logic;
		  	data_out: out unsigned(14 downto 0)
		);
   	end component;

    signal wr_en, rst, clk: std_logic;
    signal data_out: unsigned(14 downto 0);

    begin 

    pc: pc32bits port map ( clk => clk,
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
