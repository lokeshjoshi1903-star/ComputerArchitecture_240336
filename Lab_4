# LAB REPORT

## Title

**VHDL Code for Combinational Circuits (Multiplexer and Demultiplexer)**

## Objective

* To study the design and implementation of combinational circuits using VHDL.
* To write, simulate, and verify the VHDL code for a Multiplexer (MUX) and a Demultiplexer (DEMUX).
* To understand the functionality of data selection and data distribution circuits.

## Theory

### Multiplexer (MUX)

A Multiplexer is a combinational circuit that selects one input from multiple inputs and forwards it to a single output line based on the selection inputs. It is also known as a **data selector**.

For a **4:1 Multiplexer**, there are:

* Four data inputs (I0, I1, I2, I3)
* Two select lines (S0, S1)
* One output (Y)

#### Truth Table of 4:1 MUX

| S1 | S0 | Output Y |
| -- | -- | -------- |
| 0  | 0  | I0       |
| 0  | 1  | I1       |
| 1  | 0  | I2       |
| 1  | 1  | I3       |

### Demultiplexer (DEMUX)

A Demultiplexer is a combinational circuit that takes a single input and distributes it to one of many outputs according to the select lines. It is also known as a **data distributor**.

For a **1:4 DEMUX**, there are:

* One data input (D)
* Two select lines (S0, S1)
* Four outputs (Y0, Y1, Y2, Y3)

#### Truth Table of 1:4 DEMUX

| S1 | S0 | Active Output |
| -- | -- | ------------- |
| 0  | 0  | Y0 = D        |
| 0  | 1  | Y1 = D        |
| 1  | 0  | Y2 = D        |
| 1  | 1  | Y3 = D        |

## Apparatus/Software Required

* Computer System
* Xilinx ISE / Vivado / ModelSim
* VHDL Compiler and Simulator

---

# VHDL Program for 4:1 Multiplexer

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4to1 is
    Port (
        I0, I1, I2, I3 : in STD_LOGIC;
        S : in STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC
    );
end mux4to1;

architecture Behavioral of mux4to1 is
begin
    process(I0, I1, I2, I3, S)
    begin
        case S is
            when "00" => Y <= I0;
            when "01" => Y <= I1;
            when "10" => Y <= I2;
            when "11" => Y <= I3;
            when others => Y <= '0';
        end case;
    end process;
end Behavioral;
```

---

# VHDL Program for 1:4 Demultiplexer

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1to4 is
    Port (
        D : in STD_LOGIC;
        S : in STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end demux1to4;

architecture Behavioral of demux1to4 is
begin
    process(D, S)
    begin
        Y <= "0000";

        case S is
            when "00" => Y(0) <= D;
            when "01" => Y(1) <= D;
            when "10" => Y(2) <= D;
            when "11" => Y(3) <= D;
            when others => Y <= "0000";
        end case;
    end process;
end Behavioral;
```

---

## Simulation Results

### Multiplexer

* When S = "00", output follows I0.
* When S = "01", output follows I1.
* When S = "10", output follows I2.
* When S = "11", output follows I3.

### Demultiplexer

* When S = "00", input D appears at Y0.
* When S = "01", input D appears at Y1.
* When S = "10", input D appears at Y2.
* When S = "11", input D appears at Y3.

## Observation

The simulation results matched the expected truth tables. The Multiplexer successfully selected one input based on the select lines, while the Demultiplexer routed the input signal to the selected output line.

## Conclusion

The VHDL implementation of the 4:1 Multiplexer and 1:4 Demultiplexer was successfully designed, compiled, and simulated. The outputs obtained from the simulation verified the correct operation of both combinational circuits, demonstrating the effectiveness of VHDL in digital system design.
