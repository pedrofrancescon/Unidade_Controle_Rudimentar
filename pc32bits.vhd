library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity pc32bits is
	port( clk: in std_logic;
		  rst: in std_logic;
		  wr_en: in std_logic;
		  data_out: out unsigned(31 downto 0)
	);
end entity;

architecture a_pc32bits of pc32bits is
	
	component reg32bits
	    port( clk: in std_logic;
		  	  rst: in std_logic;
		  	  wr_en: in std_logic;
		  	  data_in: in unsigned(31 downto 0);
		  	  data_out: out unsigned(31 downto 0)
			);
    end component;

    signal data_i: unsigned(31 downto 0);
    signal data_o: unsigned(31 downto 0);

    begin

    	reg: reg32bits port map( clk=>clk , rst=>rst , wr_en=>wr_en , data_in=>data_i , data_out=>data_o );

    	process(clk,rst,wr_en)
		begin
			if rst='1' then
				data_i <= "00000000000000000000000000000000";
			elsif wr_en='1' then
				if rising_edge(clk) then
					data_i <= data_o + "00000000000000000000000000000001";
				end if;
			end if;
		end process;

		data_out <= data_o;

end architecture;