# VHDL Code for Combinational Circuits — 2-Bit Comparator

## Objective

* To study the working principle of a 2-bit digital comparator.
* To design and implement a 2-bit comparator using VHDL.
* To verify the functionality of the comparator through a VHDL testbench.

---

# Theory

A **Comparator** is a combinational logic circuit that compares two binary numbers and determines their relationship. The outputs of a comparator depend only on the present input values.

A **2-bit Comparator** compares two 2-bit binary numbers **A** and **B** and produces three output signals:

* **EQ** → High (`1`) when `A = B`
* **GT** → High (`1`) when `A > B`
* **LT** → High (`1`) when `A < B`

Only one of these outputs is high at any given time.

---

# Logic Diagram

The comparator first compares the Most Significant Bits (MSBs) of the two inputs. If the MSBs are equal, it compares the Least Significant Bits (LSBs). Based on these comparisons, it activates one of the three outputs: **GT**, **LT**, or **EQ**.

---

# Truth Table

|  A  |  B  |  GT |  LT |  EQ |
| :-: | :-: | :-: | :-: | :-: |
|  00 |  00 |  0  |  0  |  1  |
|  00 |  01 |  0  |  1  |  0  |
|  00 |  10 |  0  |  1  |  0  |
|  00 |  11 |  0  |  1  |  0  |
|  01 |  00 |  1  |  0  |  0  |
|  01 |  01 |  0  |  0  |  1  |
|  01 |  10 |  0  |  1  |  0  |
|  01 |  11 |  0  |  1  |  0  |
|  10 |  00 |  1  |  0  |  0  |
|  10 |  01 |  1  |  0  |  0  |
|  10 |  10 |  0  |  0  |  1  |
|  10 |  11 |  0  |  1  |  0  |
|  11 |  00 |  1  |  0  |  0  |
|  11 |  01 |  1  |  0  |  0  |
|  11 |  10 |  1  |  0  |  0  |
|  11 |  11 |  0  |  0  |  1  |

---

# Algorithm

1. Read the two 2-bit inputs **A** and **B**.
2. Compare the values of **A** and **B**.
3. If **A > B**, set **GT = 1**.
4. If **A < B**, set **LT = 1**.
5. If **A = B**, set **EQ = 1**.
6. Display the comparison result.

---

# Design File

**Filename:** `comparator_2bit.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COMPARATOR_2BIT is
    port (
        A  : in  std_logic_vector(1 downto 0);
        B  : in  std_logic_vector(1 downto 0);
        EQ : out std_logic; -- A = B
        GT : out std_logic; -- A > B
        LT : out std_logic  -- A < B
    );
end entity COMPARATOR_2BIT;

architecture Behavioral of COMPARATOR_2BIT is
begin
    process(A, B)
    begin
        -- EQ = (A1 ⊕ B1)' · (A0 ⊕ B0)'
        EQ <= not (A(1) xor B(1)) and not (A(0) xor B(0));

        -- GT = A1·B1' + (A1 ⊕ B1)' · A0·B0'
        GT <= (A(1) and not B(1)) or
              (not (A(1) xor B(1)) and A(0) and not B(0));

        -- LT = A1'·B1 + (A1 ⊕ B1)' · A0'·B0
        LT <= (not A(1) and B(1)) or
              (not (A(1) xor B(1)) and not A(0) and B(0));
    end process;
end architecture Behavioral;
```

---

# Testbench File

**Filename:** `comparator_tb.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR_TB is
end entity COMPARATOR_TB;

architecture Simulation of COMPARATOR_TB is

    signal A, B       : std_logic_vector(1 downto 0) := "00";
    signal EQ, GT, LT : std_logic;

begin

    DUT : entity work.COMPARATOR_2BIT
        port map (
            A => A,
            B => B,
            EQ => EQ,
            GT => GT,
            LT => LT
        );

    STIMULUS : process
    begin

        A <= "00"; B <= "00"; wait for 10 ns;
        A <= "01"; B <= "00"; wait for 10 ns;
        A <= "00"; B <= "01"; wait for 10 ns;
        A <= "10"; B <= "11"; wait for 10 ns;
        A <= "11"; B <= "10"; wait for 10 ns;
        A <= "11"; B <= "11"; wait for 10 ns;

        wait;

    end process;

end architecture Simulation;
```

---

# Expected Output

<img width="1244" height="778" alt="image (1)" src="https://github.com/user-attachments/assets/b0a51f6a-c742-4acc-894b-b8b277047178" />

---


# Result

The 2-bit comparator was successfully designed using VHDL and verified using a testbench. The outputs correctly indicate whether the first binary input is greater than, less than, or equal to the second binary input for all tested cases.

---

# Conclusion

The experiment successfully demonstrated the design and verification of a 2-bit comparator using VHDL. The comparator correctly performs binary comparison and produces accurate **GT**, **LT**, and **EQ** outputs. This project provides a solid understanding of combinational logic circuit design and VHDL implementation.
