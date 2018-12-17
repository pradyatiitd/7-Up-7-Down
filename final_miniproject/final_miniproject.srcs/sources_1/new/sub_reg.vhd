----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2017 22:43:50
-- Design Name: 
-- Module Name: sub_reg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
------------------register_file----------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ne_D_FF is
	PORT(D,clk: in std_logic;
	     Q: out std_logic);
end entity ne_D_FF;
	 
architecture behavioral of ne_D_FF is
begin
	process(clk)
	begin
	   if clk='1' and clk'EVENT  then
	      -- if(push='1') then
	           Q <= D;
	       --end if;
	   end if;
	end process;
end behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub_register12 is
 port(a:in std_logic_vector(11 downto 0);
      --push:in std_logic;
      clk:in std_logic;
      k:out std_logic_vector(11 downto 0));
end entity sub_register12;

architecture reg of sub_register12 is
component ne_D_FF
    PORT(D,clk: in std_logic;
	     Q: out std_logic);
end component;
begin
  nD_FF0: ne_D_FF
        port map(D=>a(0),clk=>clk,Q=>k(0));
  nD_FF1:ne_D_FF
        port map(D=>a(1),clk=>clk,Q=>k(1));
  nD_FF2: ne_D_FF
        port map(D=>a(2),clk=>clk,Q=>k(2));
  nD_FF3: ne_D_FF
        port map(D=>a(3),clk=>clk,Q=>k(3));
  nD_FF4: ne_D_FF
        port map(D=>a(4),clk=>clk,Q=>k(4));
  nD_FF5:ne_D_FF
        port map(D=>a(5),clk=>clk,Q=>k(5));
  nD_FF6:ne_D_FF
        port map(D=>a(6),clk=>clk,Q=>k(6));
  nD_FF7:ne_D_FF
        port map(D=>a(7),clk=>clk,Q=>k(7));
  nD_FF8:ne_D_FF
        port map(D=>a(8),clk=>clk,Q=>k(8));
  nD_FF9:ne_D_FF
        port map(D=>a(9),clk=>clk,Q=>k(9));
  nD_FF10:ne_D_FF
        port map(D=>a(10),clk=>clk,Q=>k(10));
  nD_FF11:ne_D_FF
        port map(D=>a(11),clk=>clk,Q=>k(11));  
end architecture reg;
-----------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sub_reg is
  Port (
            clk:in std_logic;
            subin1:in std_logic_vector(11 downto 0);
            subin2:in std_logic_vector(11 downto 0);
            subout1:out std_logic_vector(11 downto 0);
            subout2:out std_logic_vector(11 downto 0)
        );
end sub_reg;

architecture Behavioral of sub_reg is
component sub_register12
     port(a:in std_logic_vector(11 downto 0);
     --push:in std_logic;
     clk:in std_logic;
     k:out std_logic_vector(11 downto 0));
end component;

begin
sub1:sub_register12
    port map(a=>subin1,clk=>clk,k=>subout1);

sub2:sub_register12
        port map(a=>subin2,clk=>clk,k=>subout2);

end Behavioral;
