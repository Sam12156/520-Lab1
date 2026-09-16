library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_rgb_led_top is
--  Port ( );
end tb_rgb_led_top;

architecture Behavioral of tb_rgb_led_top is
    constant CLK_PERIOD : time := 8 ns;  -- 125 MHz

    signal sysclk  : std_logic := '0';
    signal rst     : std_logic;
    signal sw      : std_logic_vector(2 downto 0);
    signal led_en  : std_logic;
    signal rgb_out : std_logic_vector(2 downto 0);

begin

    uut : entity work.rgb_led_top
        generic map (R => 7, CLK_CYCLES_PER_TOGGLE => 8)
        port map (
            sysclk  => sysclk,
            rst     => rst,
            sw      => sw,
            led_en  => led_en,
            rgb_out => rgb_out
        );

    sysclk <= not sysclk after CLK_PERIOD / 2;

    process
    begin
        rst    <= '1';
        led_en <= '0';
        sw     <= "000";
        wait for 5*CLK_PERIOD;

        rst <= '0';
        wait for 5*CLK_PERIOD;

        led_en <= '1';
        
        sw     <= "001";
        wait for 60*CLK_PERIOD;

        sw <= "010";
        wait for 60*CLK_PERIOD;

        sw <= "100";
        wait for 60*CLK_PERIOD;

        sw <= "011";
        wait for 60*CLK_PERIOD;

        wait;

    end process;
end Behavioral;