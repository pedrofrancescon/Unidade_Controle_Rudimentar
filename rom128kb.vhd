library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity rom128kb is
	port( clk : in std_logic;
		  endereco : in unsigned(14 downto 0);
		  dado : out unsigned(31 downto 0)
		  );
end entity;

architecture a_rom128kb of rom128kb is
	type mem is array (0 to 31999) of unsigned(31 downto 0); 
	constant conteudo_rom : mem := (
      	-- caso endereco => conteudo
		0=> "00000000000000000000000000000001",
		1=> "00000000000000000000000000000010",
		2=> "00000000000000000000000000000011",
		-- abaixo: casos omissos => (zero em todos os bits) 
		others => (others=>'0')
	);
begin 
	process(clk)
	begin
		if(rising_edge(clk)) then
			dado <= conteudo_rom(to_integer(endereco)); 
		end if;
	end process; 
end architecture;