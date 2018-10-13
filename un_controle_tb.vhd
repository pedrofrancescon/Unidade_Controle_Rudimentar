library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity un_controle_tb is
end entity;

architecture a_un_controle_tb of un_controle_tb is
    component un_controle
    port( clk: in std_logic;
          rst: in std_logic;
          pc_wr_en: out std_logic;
          jump_en: out std_logic;
          endereco: out unsigned (14 downto 0);
          instr: in unsigned(31 downto 0)
    );
   	end component;

signal clk,rst, pc_wr_en, jump_en: std_logic;
signal endereco: unsigned(14 downto 0);
signal instr: unsigned(31 downto 0);

begin

controle: un_controle port map (clk=>clk, rst=>rst, pc_wr_en=>pc_wr_en, jump_en=>jump_en,
                                endereco=> endereco,
                                instr=>instr);

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
instr <= "00000000000000000010101101100000";
wait for 10 ns;
rst <= '0';
instr <= "00000000000000011111111111111111";
wait for 100 ns;
instr <= "00000000000000000010001111100000";
wait for 100 ns;
instr <= "00000000000000010101111111110000";
wait for 100 ns;
instr <= "00000000000000000110101111100000";
wait for 100 ns;
wait;
end process;

end architecture;
