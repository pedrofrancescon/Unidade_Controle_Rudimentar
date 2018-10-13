library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux15bits is
	 port(   entr0 : in unsigned(14 downto 0);
			 entr1 : in unsigned(14 downto 0);
			 sel : in std_logic;
			 saida : out unsigned(14 downto 0));
end entity;

architecture a_mux15bits of mux15bits is
begin
	 saida <= entr0 when sel='0' else
			  entr1 when sel='1' else
			  "000000000000000";
end architecture;
