
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rgb_led_top is
    generic (
        CLK_CYCLES_PER_TOGGLE : integer := 62500000; --62500000
        R : integer := 26 --67,108,864
        );
    Port (
        sysclk  : in  std_logic;
        rst      : in  std_logic;
        sw       : in  std_logic_vector(2 downto 0);
        led_en   :in std_logic;
        rgb_out  : out std_logic_vector(2 downto 0)
    );
end rgb_led_top;

architecture Behavioral of rgb_led_top is


    signal led_out_i : std_logic;
    signal rgb_out_i : std_logic_vector(2 downto 0);



begin


       
    

    blink_inst : entity work.blinking_led
        generic map (
            CLK_CYCLES_PER_TOGGLE => CLK_CYCLES_PER_TOGGLE,  -- 125 MHz / 62,500,000 = 0.5 s -> 1 s blink period
            R                     => R
        )
        port map (
            sysclk => sysclk,
            rst     => rst,
            led_en  => led_en,
            led_out => led_out_i
        );
        
        
     with sw select
        rgb_out_i <=
            "001" when "001",
            "010" when "010",
            "100" when "100",
            "000" when others;
            
      process(sysclk)
      begin
        if rising_edge(sysclk) then
                if led_out_i = '1' then
                    rgb_out <= rgb_out_i;
                else
                    rgb_out <= "000";
                end if;
         end if;
      end process;         

end Behavioral;