# **Lab Report**

# **VHDL Code for Sequential Circuits — Flip-Flops**

---

## **Title**

**VHDL Code for Sequential Circuits — Flip-Flops**

---

## **Objective**

* To understand the concept of sequential logic circuits.
* To design and implement different types of flip-flops using VHDL.
* To simulate the behavior of flip-flops using a VHDL simulator.
* To verify the truth table and timing characteristics through simulation.

---

## **Introduction**

Sequential circuits are digital circuits whose outputs depend not only on the current inputs but also on the previous state of the system. Unlike combinational circuits, sequential circuits contain memory elements that store information.

The basic memory element used in sequential circuits is the **Flip-Flop**. Flip-flops are edge-triggered devices that change their state only at a specific clock edge (rising or falling edge). They are widely used in registers, counters, shift registers, memory units, and finite state machines.

The most common types of flip-flops are:

* SR Flip-Flop
* D Flip-Flop
* JK Flip-Flop
* T Flip-Flop

---

# Theory

## Sequential Logic

A sequential logic circuit consists of:

* Logic Gates
* Memory Elements
* Clock Signal

The next state of the circuit is given by

**Next State = f(Current State, Inputs)**

The output depends upon

**Output = f(Current State, Inputs)**

---

# Types of Flip-Flops

---

## 1. SR Flip-Flop

The SR (Set-Reset) Flip-Flop has two inputs:

* S (Set)
* R (Reset)

### Truth Table

| Clock | S | R | Q(next)   |
| ----- | - | - | --------- |
| ↑     | 0 | 0 | No Change |
| ↑     | 0 | 1 | 0         |
| ↑     | 1 | 0 | 1         |
| ↑     | 1 | 1 | Invalid   |

---

## 2. D Flip-Flop

The D (Data) Flip-Flop eliminates the invalid condition of the SR Flip-Flop.

### Truth Table

| Clock | D | Q(next) |
| ----- | - | ------- |
| ↑     | 0 | 0       |
| ↑     | 1 | 1       |

---

## 3. JK Flip-Flop

The JK Flip-Flop improves the SR Flip-Flop by removing the invalid condition.

### Truth Table

| Clock | J | K | Q(next)   |
| ----- | - | - | --------- |
| ↑     | 0 | 0 | No Change |
| ↑     | 0 | 1 | 0         |
| ↑     | 1 | 0 | 1         |
| ↑     | 1 | 1 | Toggle    |

---

## 4. T Flip-Flop

The T (Toggle) Flip-Flop changes its output whenever T = 1.

### Truth Table

| Clock | T | Q(next)   |
| ----- | - | --------- |
| ↑     | 0 | No Change |
| ↑     | 1 | Toggle    |


---

# Design Files

---

## 1. D Flip-Flop

**Filename:** `d_flipflop.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FLIPFLOP is
    Port (
        clk : in STD_LOGIC;
        D   : in STD_LOGIC;
        Q   : out STD_LOGIC
    );
end D_FLIPFLOP;

architecture Behavioral of D_FLIPFLOP is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            Q <= D;
        end if;
    end process;
end Behavioral;
```

---

## 2. SR Flip-Flop

**Filename:** `sr_flipflop.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_FLIPFLOP is
    Port (
        clk : in STD_LOGIC;
        S   : in STD_LOGIC;
        R   : in STD_LOGIC;
        Q   : out STD_LOGIC
    );
end SR_FLIPFLOP;

architecture Behavioral of SR_FLIPFLOP is
signal temp : STD_LOGIC := '0';
begin
process(clk)
begin
    if rising_edge(clk) then
        if S='0' and R='0' then
            temp <= temp;
        elsif S='0' and R='1' then
            temp <= '0';
        elsif S='1' and R='0' then
            temp <= '1';
        end if;
    end if;
end process;

Q <= temp;

end Behavioral;
```

---

## 3. JK Flip-Flop

**Filename:** `jk_flipflop.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FLIPFLOP is
    Port (
        clk : in STD_LOGIC;
        J   : in STD_LOGIC;
        K   : in STD_LOGIC;
        Q   : out STD_LOGIC
    );
end JK_FLIPFLOP;

architecture Behavioral of JK_FLIPFLOP is
signal temp : STD_LOGIC := '0';
begin

process(clk)
begin
    if rising_edge(clk) then
        if J='0' and K='0' then
            temp <= temp;
        elsif J='0' and K='1' then
            temp <= '0';
        elsif J='1' and K='0' then
            temp <= '1';
        else
            temp <= not temp;
        end if;
    end if;
end process;

Q <= temp;

end Behavioral;
```

---

## 4. T Flip-Flop

**Filename:** `t_flipflop.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FLIPFLOP is
    Port (
        clk : in STD_LOGIC;
        T   : in STD_LOGIC;
        Q   : out STD_LOGIC
    );
end T_FLIPFLOP;

architecture Behavioral of T_FLIPFLOP is
signal temp : STD_LOGIC := '0';
begin

process(clk)
begin
    if rising_edge(clk) then
        if T='1' then
            temp <= not temp;
        end if;
    end if;
end process;

Q <= temp;

end Behavioral;
```

---

# Output
<img width="995" height="630" alt="image" src="https://github.com/user-attachments/assets/08cc5cf8-e7af-4ef9-b415-c58773e73f02" />


# Conclusion

The experiment successfully demonstrated the design and simulation of **SR, D, JK, and T Flip-Flops** using VHDL. The behavioral simulation confirmed that each flip-flop operated according to its characteristic truth table and responded correctly to the rising edge of the clock signal. This experiment provided practical experience in designing sequential circuits using VHDL and reinforced the importance of flip-flops as fundamental memory elements in digital systems such as registers, counters, finite state machines, and memory devices.
