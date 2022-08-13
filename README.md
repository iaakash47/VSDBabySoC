# VSDbabySoC

VSDBabySoC is a small yet powerful RISCV-based SoC. The main purpose of designing such a small SoC is to test three open-source IP cores together for the first time and calibrate the analog part of it. VSDBabySoC contains one RVMYTH microprocessor, an 8x-PLL to generate a stable clock, and a 10-bit DAC to communicate with other analog devices.
![vsdbabysoc_block_diagram](https://user-images.githubusercontent.com/88897605/180599763-78185474-74f2-4a87-ad23-8b58d147ba27.png)

## Introduction to SoC

A system on a chip, also known as an SoC, is essentially an integrated circuit or an IC that takes a single platform and integrates an entire electronic or computer system onto it. It is, exactly as its name suggests, an entire system on a single chip. The components that an SoC generally looks to incorporate within itself include a central processing unit, input and output ports, internal memory, as well as analog input and output blocks among other things. Depending on the kind of system that has been reduced to the size of a chip, it can perform a variety of functions including signal processing, wireless communication, artificial intelligence and more.

## What is RVMYTH
RVMYTH core is a simple RISCV-based CPU, introduced in a workshop by RedwoodEDA and VSD. During a 5-day workshop students (including middle-schoolers) managed to create a processor from scratch. The workshop used the TLV for faster development. All of the present and future contributions to the IP will be done by students and under open-source licenses.

## What is PLL
A phase-locked loop or PLL is a control system that generates an output signal whose phase is related to the phase of an input signal. PLLs are widely used for synchronization purposes, including clock generation and distribution.

## What is DAC
A digital-to-analog converter or DAC is a system that converts a digital signal into an analog signal. DACs are widely used in modern communication systems enabling the generation of digitally-defined transmission signals. As a result, high-speed DACs are used for mobile communications and ultra-high-speed DACs are employed in optical communications systems.

## VSDBabySoC Modeling

* Here we are going to model and simulate the VSDBabySoC using iverilog, then we will show the results using gtkwave tool. 
* Some initial input signals will be fed into vsdbabysoc module that make the pll start generating the proper CLK for the circuit.
* The clock signal will make the rvmyth to execute instructions in its imem
* These values are used by dac core to provide the final output signal named OUT


![VSDbabySoc_Pre_Synthesis](https://user-images.githubusercontent.com/88897605/184362846-9c4206c8-bf0d-40cd-bbb3-d97bd5830f9c.png)



In this picture we can see the following signals:

* CLK: This is the input CLK signal of the RVMYTH core. This signal comes from the PLL, originally.
* reset: This is the input reset signal of the RVMYTH core. This signal comes from an external source, originally.
* OUT: This is the output OUT signal of the VSDBabySoC module. This signal comes from the DAC (due to simulation restrictions it behaves like a digital     signal which is incorrect), originally.
* RV_TO_DAC[9:0]: This is the 10-bit output [9:0] OUT port of the RVMYTH core. This port comes from the RVMYTH register #17, originally.
* OUT: This is a real datatype wire which can simulate analog values. It is the output wire real OUT signal of the DAC module. This signal comes from the   DAC, originally.

**PLEASE NOTE** that the sythesis process does not support `real` variables, so we must use the simple `wire` datatype for the `\vsdbabysoc.OUT` instead. The `iverilog` simulator always behaves `wire` as a digital signal. As a result we can not see the analog output via `\vsdbabysoc.OUT` port and we need to use `\dac.OUT` (which is a `real` datatype) instead.

# Post-synthesis simulation

![VSDbabySoC_Post_Synthesis](https://user-images.githubusercontent.com/88897605/184362895-39e19c4c-c81a-44ea-b60c-a3fdd886a363.png)


In this picture we can see the following signals:

* \core.CLK: This is the input CLK signal of the RVMYTH core. This signal comes from the PLL, originally.
* reset: This is the input reset signal of the RVMYTH core. This signal comes from an external source, originally.
* OUT: This is the output OUT signal of the VSDBabySoC module. This signal comes from the DAC (due to simulation restrictions it behaves like a digital     signal which is incorrect), originally.
* \core.OUT[9:0]: This is the 10-bit output [9:0] OUT port of the RVMYTH core. This port comes from the RVMYTH register #17, originally.
* OUT: This is a real datatype wire which can simulate analog values. It is the output wire real OUT signal of the DAC module. This signal comes from the   DAC, originally.

**PLEASE NOTE** that the sythesis process does not support `real` variables, so we must use the simple `wire` datatype for the `\vsdbabysoc.OUT` instead. The `iverilog` simulator always behaves `wire` as a digital signal. As a result we can not see the analog output via `\vsdbabysoc.OUT` port and we need to use `\dac.OUT` (which is a `real` datatype) instead.

### VSDbabySoC Block

![VSDbabySoC_Block](https://user-images.githubusercontent.com/88897605/184362942-a7d9be30-077c-40ac-9003-dbdf9be5fd06.png)


### VSDbabySoC Schematic View

![Schematic_VSDbabySoC](https://user-images.githubusercontent.com/88897605/184362969-73f79bef-454b-4cc6-ac2b-cca60f558f29.png)


### RISC-V Core
![risc_v_core](https://user-images.githubusercontent.com/88897605/184363013-96ce58d3-3a15-4301-9cfd-c01166a09731.png)


# Contributor
Aakash K</br>
Contact:iaakashkrish@gmail.com</br>

# Acknowledgements

- [Kunal Ghosh](https://github.com/kunalg123), Co-founder, VSD Corp. Pvt. Ltd - kunalpghosh@gmail.com
