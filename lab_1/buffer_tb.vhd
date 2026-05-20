library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BUFFER_TB is
end BUFFER_TB;

architecture Simulation of BUFFER_TB is

    signal tb_A : std_logic := '0';
    signal tb_Y : std_logic;

begin

    DUT : entity work.MY_BUFFER
    port map (
        A => tb_A,
        Y => tb_Y
    );

    process
    begin
        tb_A <= '0';
        wait for 10 ns;

        tb_A <= '1';
        wait for 10 ns;

        tb_A <= '0';
        wait for 10 ns;

        wait;
    end process;

end Simulation;