library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_rom is
	port( clk: in std_logic;
		  rst: in std_logic;
		  jump: in std_logic;
		  wr_en: in std_logic;
		  data_in: in unsigned(14 downto 0); --endereço do jump
		  data_out: out unsigned(31 downto 0)
	);
end entity;

architecture a_pc_rom of pc_rom is

	component pc15bits
	port( clk: in std_logic;
		  rst: in std_logic;
		  wr_en: in std_logic;
		  jump_en: in std_logic;
		  data_in: in unsigned(14 downto 0); --proximo endereco pro jump
		  data_out: out unsigned(14 downto 0) --endereco atual
	);
   	end component;

   	component rom128kb
    	port( clk : in std_logic;
		  	  endereco : in unsigned(14 downto 0);
		      dado : out unsigned(31 downto 0)
		    );
    end component;

    signal data_s: unsigned(14 downto 0);

    begin

    	rom: rom128kb port map ( clk => clk,
		   					 	 endereco => data_s,
							 	 dado => data_out
							   );

    	pc: pc15bits port map ( clk => clk,
		   						rst => rst,
								jump_en => jump,
								wr_en => wr_en,
								data_in => data_in,
								data_out => data_s
						   	  );

end architecture;
