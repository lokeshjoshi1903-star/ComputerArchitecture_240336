# **Lab 8: VHDL Code for Sequential Circuits — Counters**

---

# **Objective**

* To design and implement a 4-bit synchronous up counter using VHDL.
* To develop a 4-bit synchronous up/down counter with direction control.
* To verify the functionality of the counters through simulation.
* To understand the operation and applications of sequential counters in digital systems.

---

# **Theory**

A **counter** is a sequential logic circuit that changes its output state in response to clock pulses. Unlike combinational circuits, counters store their previous state using flip-flops, making them suitable for applications that require counting and sequencing operations.

Counters are commonly categorized as **synchronous** and **asynchronous**. In a synchronous counter, all flip-flops receive the same clock signal simultaneously, resulting in faster operation and reduced propagation delay compared to ripple counters.

An **up counter** increases its count by one with every rising edge of the clock, while an **up/down counter** can either increment or decrement the count depending on a direction control signal. A **4-bit counter** provides **16 unique states**, counting from **0000 (0)** to **1111 (15)** before returning to **0000**.

The VHDL implementation uses the **IEEE.NUMERIC_STD** library to perform arithmetic operations on an internal **unsigned** signal. The final count value is converted to **std_logic_vector** and assigned to the output port.

---

# **Design Files**

## **1. 4-bit Synchronous Up Counter**

**Filename:** `counter_up.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COUNTER_UP is
    port (
        CLK   : in  std_logic;
        RST   : in  std_logic;  -- Active-high synchronous reset
        COUNT : out std_logic_vector(3 downto 0)
    );
end entity COUNTER_UP;

architecture Behavioral of COUNTER_UP is
    signal count_int : unsigned(3 downto 0) := (others => '0');
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                count_int <= (others => '0');
            else
                count_int <= count_int + 1;
            end if;
        end if;
    end process;

    COUNT <= std_logic_vector(count_int);
end architecture Behavioral;
```

---

## **2. 4-bit Synchronous Up/Down Counter**

**Filename:** `counter_updown.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COUNTER_UPDOWN is
    port (
        CLK   : in  std_logic;
        RST   : in  std_logic;  -- Active-high synchronous reset
        UP    : in  std_logic;  -- '1' = count up, '0' = count down
        COUNT : out std_logic_vector(3 downto 0)
    );
end entity COUNTER_UPDOWN;

architecture Behavioral of COUNTER_UPDOWN is
    signal count_int : unsigned(3 downto 0) := (others => '0');
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                count_int <= (others => '0');
            elsif UP = '1' then
                count_int <= count_int + 1;
            else
                count_int <= count_int - 1;
            end if;
        end if;
    end process;

    COUNT <= std_logic_vector(count_int);
end architecture Behavioral;
```

---

# **Testbench File**

**Filename:** `counter_tb.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COUNTER_TB is
end entity COUNTER_TB;

architecture Simulation of COUNTER_TB is
    signal CLK      : std_logic := '0';
    signal RST      : std_logic := '0';
    signal UP       : std_logic := '1';
    signal COUNT_UP : std_logic_vector(3 downto 0);
    signal COUNT_UD : std_logic_vector(3 downto 0);

    constant CLK_PERIOD : time := 20 ns;
begin
    -- Clock generation
    CLK <= not CLK after CLK_PERIOD / 2;

    U1 : entity work.COUNTER_UP
        port map (CLK => CLK, RST => RST, COUNT => COUNT_UP);

    U2 : entity work.COUNTER_UPDOWN
        port map (CLK => CLK, RST => RST, UP => UP, COUNT => COUNT_UD);

    STIMULUS : process
    begin
        -- Reset both counters
        RST <= '1';
        wait for 40 ns;
        RST <= '0';

        -- Count up for 10 clock cycles
        UP <= '1';
        wait for 200 ns;

        -- Count down for 5 clock cycles
        UP <= '0';
        wait for 100 ns;

        -- Reset and count up again
        RST <= '1';
        wait for 40 ns;
        RST <= '0';
        UP <= '1';
        wait for 200 ns;

        wait;
    end process;
end architecture Simulation;
```

---

# **Output**

The waveform obtained from GTKWave verified the correct operation of both counters.
<img width="1920" height="1026" alt="image" src="https://github.com/user-attachments/assets/59700b67-f87b-4602-aae4-0fe882565274" />



---

# **Discussion**

The counters were successfully designed and verified using VHDL behavioral modeling. The simulation demonstrated that both designs responded accurately to the clock signal and synchronous reset. The up counter continuously increased its count, while the up/down counter correctly changed its counting direction according to the **UP** control signal. The use of the **IEEE.NUMERIC_STD** package simplified arithmetic operations on unsigned data types, making the code more readable and reliable. The waveform generated in GTKWave confirmed proper counting, overflow, reset functionality, and directional control, validating the correctness of the implemented designs.

---

# **Conclusion**

This experiment successfully implemented and simulated **4-bit synchronous up** and **4-bit synchronous up/down counters** using VHDL. The behavioral simulation verified that both counters operated correctly under different input conditions, including counting, resetting, and changing counting direction. The experiment enhanced understanding of sequential circuit design, clock-driven operations, and VHDL programming techniques. These counters are essential building blocks in digital systems and form the basis for applications such as timers, frequency dividers, event counters, finite state machines, and embedded system controllers.
