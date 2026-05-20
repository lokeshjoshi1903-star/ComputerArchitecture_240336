# Lab 1: Introduction to VHDL Programming and Open-Source Simulation Environment

## Objective
- To set up and configure the VHDL development environment using VS Code, GHDL, and GTKWave.  
- To understand the fundamental structure and components of a VHDL design.  
- To write, simulate, and visualize a basic VHDL program.

## Theory
VHDL (VHSIC Hardware Description Language) is an IEEE-standard hardware description language used to model digital systems. It allows designers to describe hardware behavior at different levels of abstraction, including behavioral, dataflow, and structural modeling.

A VHDL design consists of three main parts:

**1. Library and Packages**  
These contain predefined data types and functions. The IEEE library is commonly used to support `std_logic` and `std_logic_vector`.

**2. Entity**  
The entity defines the external interface of the circuit, including input and output ports. It represents the “black box” view of the design.

**3. Architecture**  
The architecture defines the internal behavior or structure of the entity. It describes how outputs are generated from inputs.

### VHDL Design Flow
1. Analysis (Compilation)  
2. Elaboration  
3. Simulation  
4. Waveform Visualization (GTKWave)

### Lab Setup
This lab uses an open-source toolchain:

- **VS Code** – Code editor  
- **GHDL** – VHDL compiler and simulator  
- **GTKWave** – Waveform viewer

## Output
![Waveform Output](lab1output.png)

## Conclusion
In this lab, the VHDL development environment was successfully installed and configured using VS Code, GHDL, and GTKWave. The basic structure of VHDL including library declarations, entity, and architecture was studied.A buffer circuit was implemented and simulated using a testbench. The simulation results confirmed that the output followed the input correctly, validating proper design behavior.
Overall, this lab provided hands-on experience in VHDL coding, simulation, and waveform analysis, establishing a strong foundation for digital system design using hardware description languages.
