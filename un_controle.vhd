library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity un_controle is
	port( clk: in std_logic;
          rst: in std_logic;
		  pc_wr_en: out std_logic;
          jump_en: out std_logic;
          endereco: out unsigned (14 downto 0);
		  instr: in unsigned(31 downto 0)
	);
end entity;

architecture a_un_controle of un_controle is

	component flipflop_T
    	port( clk: in std_logic;
		  	  rst: in std_logic;
		  	  wr_en: in std_logic;
		  	  data_out: out std_logic
		);
   	end component;

    signal opcode: unsigned(4 downto 0);
    signal estado: std_logic;

    begin

    maqEstados: flipflop_T port map(clk=>clk, rst=>rst, wr_en=>'1', data_out=>estado);

    opcode <= instr(10 downto 6);
    endereco <= instr(25 downto 11);
    jump_en <= '1' when opcode="11111" else
    '0';
    pc_wr_en <= '1' when estado='0' else
    '0';
end architecture;
