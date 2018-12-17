----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2017 01:22:44 PM
-- Design Name: 
-- Module Name: Random_number_generator - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFF is
Port(
        D:in std_logic;
        clk:in std_logic;
        --reset:in std_logic;
        Q: out std_logic        
    );
end DFF;
architecture Behavioral of DFF is
begin
process(clk)
begin
    if rising_edge(clk) then
        --if(reset='1') then
            Q<=D;            
        --end if;
    end if;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Random_number_generator is
Port ( 
        seed:in std_logic;--it starts the random number generator
        --pushtorand:in std_logic;
        clk:in std_logic;
        nextseed:out std_logic;
        biit:out std_logic_vector(3 downto 0)
     );
end Random_number_generator;

architecture Behavioral of Random_number_generator is
signal o: std_logic:='1'; 
signal sigbit_int:std_logic_vector(6 downto 0):="0101011";
signal sigbit:std_logic_vector(3 downto 0):="1011";
begin
process(sigbit_int)
begin
    if(sigbit_int="0000") then
        nextseed<='1';
    else
        nextseed<=sigbit_int(0) xor sigbit_int(3);
    end if;
end process;
DFF:entity work.DFF(Behavioral) 
port map
(
    D=>seed,
    clk=>clk,
    --reset=>reset,
    Q=>sigbit_int(0)
);
biit<=sigbit(3 downto 0);
--sigbit<=sigbit_int(3 downto 0);
process(sigbit_int)
begin
    if(sigbit_int="0000") then
        sigbit<="0010";--2
    elsif(sigbit_int="0001") then
        sigbit<="0011";--3
    elsif(sigbit_int="0111") then
        sigbit<="0101";--5
    elsif(sigbit_int="1101") then
        sigbit<="1001";--9
    elsif(sigbit_int="1110") then
        sigbit<="1010";--10
    elsif(sigbit_int="1111") then
        sigbit<="1011";--11                     
    else
        --biit<=sigbit(3 downto 0);
        sigbit<=sigbit_int(3 downto 0);
    end if;
end process;

ggf:for i in 1 to 6 generate
    hjg:entity work.DFF(Behavioral)
    port map
    (   
        clk=>clk,
        --reset=>reset,
        D=>sigbit_int(i-1),
        Q=>sigbit_int(i)
    );
--sigbit(0)<=sigbit_int(0) and not(reset);    
end generate;
end Behavioral;
