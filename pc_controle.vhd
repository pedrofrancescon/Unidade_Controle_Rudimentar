library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_controle is
	port( clk: in std_logic;
          rst: in std_logic
		);
end entity;

architecture a_pc_controle of pc_controle is
	component un_controle
	port( clk: in std_logic;
          rst: in std_logic;
		  pc_wr_en: out std_logic;
          jump_en: out std_logic;
          endereco: out unsigned (14 downto 0);
		  instr: in unsigned(31 downto 0)
	);
	end component;
	component pc_rom
	port( clk: in std_logic;
		  rst: in std_logic;
		  wr_en: in std_logic;
		  data_in: in unsigned(14 downto 0); --endereço do jump
		  data_out: out unsigned(31 downto 0) --instrucao
	);
	end component;
	signal clk, rst, jump, pc_wr std_logic;
	signal endereco unsigned(14 downto 0);
	signal instrucao unsigned(31 downto 0);

begin
	control: un_controle port map(clk=>clk, rst=>rst, pc_wr_en=>pc_wr, jump_en=>jump, endereco=>endereco, instr=>instrucao);
	countMem: pc_rom port map(clk=>clk, rst=>rst, wr_en=>pc_wr, data_in=>endereco, data_out=>instrucao);


end architecture;
