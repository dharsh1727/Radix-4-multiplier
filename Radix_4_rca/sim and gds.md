# Radix-4 Multiplier_RCA – Simulation and Physical Design Results

## Overview
This project implements a **Radix-4 Booth Multiplier using RCA** designed in Verilog, simulated for functional verification, and synthesized through the **OpenLane RTL-to-GDS flow**. The design demonstrates efficient signed multiplication using Booth encoding and carry-save reduction techniques.

---

## Functional Simulation Results

### Testbench Observation
The waveform verifies correct operation of signed multiplication across multiple test cases.

| Time (ns) | X (Input) | Y (Input) | Product (Output) |
|----------|----------|----------|------------------|
| 0–20     | -128     | 76       | -9728            |
| 20–40    | -45      | 12       | -540             |
| 40–60    | -50      | -5       | 250              |
| 60–80    | 127      | 127      | 16129            |

### Key Inference
- Correct handling of **signed numbers (2’s complement)**
- Proper implementation of **Booth recoding**
- Accurate final product generation using **carry-save + final adder stage**

---

## RTL to GDS Flow (OpenLane)

The design was taken through a complete ASIC implementation flow using OpenLane:

- Synthesis (Yosys)
- Floorplanning
- Placement
- Clock Tree Synthesis (if applicable)
- Routing
- Signoff checks (DRC/LVS)
- GDS generation

---

## KLayout GDS View and Analysis

<p align="center">
  <img src="Radix_4_rca/sim and gds/Radix_4_rca_klayout.png" width="500"/>
</p>

<p align="center"><b>Figure: Final GDS Layout (KLayout View)</b></p>

### 1. Standard Cell Region
- The dense and uniform grid structure represents **standard cell placement**
- Contains:
  - Booth encoder logic  
  - Partial product generators  
  - Carry-save adders  
  - Final ripple carry adder  

This clearly indicates a **fully synthesized digital design with no macros used**.

---

### 2. Routing Network
- Multi-layer metal routing is visible:
  - Horizontal and vertical interconnects  
  - Dense routing in central regions  

This represents:
- Partial product interconnections  
- Carry propagation paths  
- Signal distribution across multiplier stages  

---

### 3. Critical Logic Clustering
- A denser region is observed near the center:
  - Corresponds to the **reduction tree (CSA stage)**  

Key Insight:
- Carry-save addition introduces heavy interconnect density  
- This region is typically the **most timing-critical portion of the design**  

---

### 4. I/O Pin Placement
- Pins are distributed along the periphery:
  - Inputs: X[7:0], Y[7:0]  
  - Outputs: Product[15:0]  

This ensures:
- Clean signal entry and exit  
- Reduced routing congestion near boundaries  

---

### 5. No Memory Macros
- The absence of large rectangular macro blocks confirms:

```text
The design uses only standard cells (combinational logic and sequential elements)
```
### Final Observation
- The layout shows uniform cell distribution with localized routing density in arithmetic regions
- No abnormal congestion or unused regions are observed
- The structure is consistent with a well-optimized standard-cell-based multiplier design
