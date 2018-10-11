library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity rom128kb_tb is
end entity;

architecture a_rom128kb_tb of rom128kb_tb is
	
	component rom128kb 
    	port( clk : in std_logic;
		  endereco : in unsigned(14 downto 0);
		  dado : out unsigned(31 downto 0)
		  );
    end component;

    signal clk: std_logic;
    signal endereco: unsigned(14 downto 0);
    signal dado: unsigned(31 downto 0);

    begin

    rom: rom128kb port map ( clk => clk,
		   					 endereco => endereco, 
							 dado => dado
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
	endereco <= "000000000000000";
	wait for 100 ns;
	endereco <= "000000000000001";
	wait for 100 ns;
	endereco <= "000000000000010";
	wait for 100 ns;
	wait;
	end process;


end architecture;