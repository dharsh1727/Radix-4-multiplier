# Radix-4 Booth Multiplier – OpenLane Implementation Results

## Flow Status
The Radix-4 Booth multiplier was successfully implemented using the OpenLane RTL-to-GDS flow.

---

## Area Results

| Parameter | Value |
|---|---:|
| Die Area | 0.0324 mm² |
| Core Area | 25181.65 µm² |
| Synthesized Cell Count | 289 |
| Total Cells after Physical Implementation | 2895 |
| OpenDP Utilization | 11.6% |

### Area Analysis
The multiplier occupies a compact die area of **0.0324 mm²**.  
The synthesized logic contains **289 standard cells**, representing the core arithmetic logic of the Radix-4 multiplier.

After physical implementation, the total cell count increases to **2895** due to the insertion of physical-only cells required for fabrication, including:

- Decap cells  
- Welltap cells  
- Filler cells  
- Diode cells  

These additional cells ensure power integrity, well formation, and manufacturability of the layout.

---

## Timing Results

| Parameter | Value |
|---|---:|
| Clock Period Constraint | 10 ns |
| Suggested Clock Period | 10 ns |
| Suggested Frequency | 100 MHz |
| Critical Path Delay | 5.26 ns |
| Final SPEF WNS | 0.0 ns |
| Final SPEF TNS | 0.0 ns |
| Reported WNS | -0.2 ns |
| Reported TNS | -0.29 ns |

### Timing Analysis
The critical path delay is **5.26 ns**, indicating that the design can operate well within the applied **10 ns clock constraint**.

A small negative slack (**WNS = -0.2 ns**) is observed in intermediate timing reports. However, the final post-route parasitic extracted (SPEF) timing shows:
WNS = 0.0 ns
TNS = 0.0 ns


This confirms that the design meets timing after extraction and is **timing-clean at signoff**.

---

## Power Results

| Power Component | Typical Value |
|---|---:|
| Internal Power | 0.000149 µW |
| Switching Power | 0.000219 µW |
| Leakage Power | 3.27e-09 µW |

### Power Analysis
The reported power is very low due to the small combinational nature of the design and limited switching activity during analysis.

- **Internal Power:** Power consumed within standard cells during switching  
- **Switching Power:** Power due to charging/discharging interconnect capacitance  
- **Leakage Power:** Static power when the circuit is idle  

Switching and internal power dominate, while leakage is negligible.

---

## Routing Results

| Parameter | Value |
|---|---:|
| Wire Length | 9632 |
| Vias | 2359 |
| Wire Count | 603 |
| Wire Bits | 1117 |

### Routing Analysis
The design exhibits moderate routing complexity typical of arithmetic circuits.

- Routing is primarily concentrated in **metal layers 2 and 3**
- Higher via count (**2359**) arises from:
  - Partial product interconnections  
  - Carry-save adder tree routing  
  - Final ripple carry adder propagation  
  - Output signal distribution  

The layout shows dense interconnect regions corresponding to the multiplier’s reduction stages.

---

## Signoff Results

| Check | Result |
|---|---:|
| DRC Violations | 0 |
| LVS Errors | 0 |
| Antenna Violations | 0 |
| Routing Violations | 0 |

### Signoff Analysis
The final layout is clean and fully verified:

-DRC = 0
-LVS = 0
-Antenna Violations = 0
-Routing Violations = 0


This confirms that the generated GDS is physically valid and matches the synthesized netlist.

---

## Final Summary

The Radix-4 Booth multiplier was successfully verified through simulation and implemented using the OpenLane ASIC flow. The design completed the RTL-to-GDS pipeline with clean signoff and valid layout generation.

### Key Results
- **Die Area:** 0.0324 mm²  
- **Core Area:** 25181.65 µm²  
- **Synthesized Cells:** 289  
- **Total Cells:** 2895  
- **Critical Path Delay:** 5.26 ns  
- **Target Frequency:** 100 MHz  
- **Final SPEF WNS/TNS:** 0.0 ns / 0.0 ns  
- **Wire Length:** 9632  
- **Vias:** 2359  
- **DRC/LVS/Antenna Violations:** 0  

The design demonstrates a complete ASIC implementation of a signed Radix-4 Booth multiplier, validating both functional correctness and physical realizability.
