###################################################################

# Created by write_sdc on Fri Aug 12 22:07:28 2022

###################################################################
set sdc_version 2.0

set_units -time ns
set_max_area 8000
set_load -pin_load 0.5 [get_ports OUT]
set_load -min -pin_load 0.5 [get_ports OUT]
create_clock [get_pins pll/CLK]  -name clk  -period 10  -waveform {0 5}
set_max_delay 10  -from [get_pins dac/OUT]  -to [get_ports OUT]
set_input_transition -max 0.4  [get_ports VCO_IN]
set_input_transition -min 0.1  [get_ports VCO_IN]
set_input_transition -max 0.4  [get_ports ENb_CP]
set_input_transition -min 0.1  [get_ports ENb_CP]
