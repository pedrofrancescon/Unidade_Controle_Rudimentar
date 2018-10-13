library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity pc15bits is
	port( clk: in std_logic;
		  rst: in std_logic;
		  wr_en: in std_logic;
		  data_out: out unsigned(14 downto 0)
	);
end entity;

architecture a_pc15bits of pc15bits is
	
	component reg15bits
	    port( clk: in std_logic;
		  	  rst: in std_logic;
		  	  wr_en: in std_logic;
		  	  data_in: in unsigned(14 downto 0);
		  	  data_out: out unsigned(14 downto 0)
			);
    end component;

    signal data_i: unsigned(14 downto 0);
    signal data_o: unsigned(14 downto 0);

    begin

    	reg: reg15bits port map( clk=>clk , rst=>rst , wr_en=>wr_en , data_in=>data_i , data_out=>data_o );

    	data_i <= data_o + "000000000000001";
		data_out <= data_o;

end architecture;