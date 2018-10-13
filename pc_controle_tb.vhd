library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_controle_tb is
end entity;

architecture a_pc_controle_tb of pc_controle_tb is
    component pc_controle
    port( clk: in std_logic;
          rst: in std_logic
		);
    end component;

    signal clk, rst: std_logic;

    begin
    pseudoProcessador: pc_controle port map(clk=>clk, rst=>rst);

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
    wait for 100 ns;

    wait;
    end process;

end architecture;
