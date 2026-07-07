# **Experiment: VHDL Code for Combinational Circuits — Code Converter**

## Aim

To design, implement, simulate, and verify combinational code converters using VHDL and analyze their outputs using GTKWave.

---

## Objectives

* To understand the concept of combinational code converters.
* To implement BCD to Excess-3 Converter using VHDL.
* To implement Binary to Gray Code Converter using VHDL.
* To verify the functionality of both circuits through simulation.

---

# Theory

A **Code Converter** is a combinational logic circuit that converts information from one binary code to another. Since it is a combinational circuit, the output depends only on the current input and does not require any memory elements.

Code converters are widely used in digital systems, communication systems, display devices, and embedded applications.

### Types of Code Converters Implemented

### 1. BCD to Excess-3 Converter

BCD (Binary Coded Decimal) represents decimal digits from 0 to 9 using four bits. Excess-3 (XS-3) is a non-weighted code obtained by adding binary **0011 (decimal 3)** to the corresponding BCD number.

**Example**

| Decimal | BCD  | Excess-3 |
| ------- | ---- | -------- |
| 0       | 0000 | 0011     |
| 1       | 0001 | 0100     |
| 2       | 0010 | 0101     |
| 5       | 0101 | 1000     |
| 9       | 1001 | 1100     |

---

### 2. Binary to Gray Code Converter

Gray Code is a binary numbering system in which only one bit changes between consecutive numbers. This minimizes switching errors and is widely used in rotary encoders, digital communication, and position sensors.

The conversion equations are:

* G3 = B3
* G2 = B3 XOR B2
* G1 = B2 XOR B1
* G0 = B1 XOR B0

---

# Algorithm

## BCD to Excess-3 Converter

1. Read the 4-bit BCD input.
2. Add binary value **0011**.
3. Generate the corresponding Excess-3 output.
4. Verify the output using simulation.

---

## Binary to Gray Converter

1. Read the 4-bit binary input.
2. Copy the Most Significant Bit (MSB) directly.
3. Perform XOR between adjacent binary bits.
4. Generate the Gray code output.
5. Verify the output using simulation.

---

# VHDL Code

## BCD to Excess-3 Converter

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bcd_xs3 is
    Port(
        bcd : in STD_LOGIC_VECTOR(3 downto 0);
        xs3 : out STD_LOGIC_VECTOR(3 downto 0)
    );
end bcd_xs3;

architecture Behavioral of bcd_xs3 is
begin
    xs3 <= std_logic_vector(unsigned(bcd) + 3);
end Behavioral;
```

---

## Testbench

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_xs3_tb is
end bcd_xs3_tb;

architecture Behavioral of bcd_xs3_tb is

component bcd_xs3
Port(
    bcd : in STD_LOGIC_VECTOR(3 downto 0);
    xs3 : out STD_LOGIC_VECTOR(3 downto 0)
);
end component;

signal bcd : STD_LOGIC_VECTOR(3 downto 0);
signal xs3 : STD_LOGIC_VECTOR(3 downto 0);

begin

uut: bcd_xs3
port map(
    bcd => bcd,
    xs3 => xs3
);

process
begin
    bcd <= "0000"; wait for 10 ns;
    bcd <= "0001"; wait for 10 ns;
    bcd <= "0101"; wait for 10 ns;
    wait;
end process;

end Behavioral;
```

---

## Binary to Gray Converter

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gray is
    Port(
        b : in STD_LOGIC_VECTOR(3 downto 0);
        g : out STD_LOGIC_VECTOR(3 downto 0)
    );
end gray;

architecture Behavioral of gray is
begin
    g(3) <= b(3);
    g(2) <= b(3) xor b(2);
    g(1) <= b(2) xor b(1);
    g(0) <= b(1) xor b(0);
end Behavioral;
```

---

## Testbench

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gray_tb is
end gray_tb;

architecture Behavioral of gray_tb is

component gray
Port(
    b : in STD_LOGIC_VECTOR(3 downto 0);
    g : out STD_LOGIC_VECTOR(3 downto 0)
);
end component;

signal b : STD_LOGIC_VECTOR(3 downto 0);
signal g : STD_LOGIC_VECTOR(3 downto 0);

begin

uut: gray
port map(
    b => b,
    g => g
);

process
begin
    b <= "0000"; wait for 10 ns;
    b <= "0001"; wait for 10 ns;
    b <= "0010"; wait for 10 ns;
    b <= "0011"; wait for 10 ns;
    b <= "0100"; wait for 10 ns;
    wait;
end process;

end Behavioral;
```

---

# Simulation Output

## BCD to Excess-3 Converter

<img width="1023" height="631" alt="image" src="https://github.com/user-attachments/assets/197f3339-d4d7-4314-859a-86d315a43d87" />


---

## Binary to Gray Converter

<img width="1014" height="629" alt="image" src="https://github.com/user-attachments/assets/4294ff27-acf2-43af-bc76-d9fddbd43022" />


---

# Applications

* Digital communication systems
* Display controllers
* Embedded systems
* Data encoding and decoding
* Rotary encoders
* Error reduction systems

---

# Advantages

* High-speed operation
* Simple combinational design
* No memory elements required
* Easy implementation in FPGA and CPLD
* Reliable and efficient data conversion

---

# Result

The **BCD to Excess-3 Converter** and **Binary to Gray Code Converter** were successfully designed and implemented using VHDL. The circuits were simulated using GHDL and verified using GTKWave. The obtained waveforms matched the expected theoretical outputs, confirming the correct operation of both combinational code converters.
