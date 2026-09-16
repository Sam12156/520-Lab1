# 520-Lab1 — LED Blinker

## Overview
This lab creates a blinking light of one of three colors with three switches selecting which 
color to display.
## Design Summary
Design uses a blinking component that outputs a 1hz toggling signal.

The RGB top vhd file inputs three switches and outputs one of three corresponding colors
It instanstiates the blinking component and the output of the RGB is turned off when the 
blinking component's output is low causing the RGB LED to flash


## Verification and Results

###Blinking LED Testbench
![Blinking LED Testbench](images/tb_blinking_led.png)
Testbench starts with rst high and led_en low

With rst low and led_en high the output, led_out, flashes on and off. 
CLK_CYCLES_PER_TOGGLE was reduced for simulation

###RGB Test Bench
![RGB Testbench](images/tb_rgb_led_top.png)
Simulation starts with rst high and led_en low then test 5 switch positions. R, G, B, GB, RGB
Output flashes with color matching the switch state and if two or more switches are high simultaneously
it turns the RGB LED off.


## Known Issues or Limitations

## References
