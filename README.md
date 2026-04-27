# Radix-4-multiplier
# Radix-4 Booth Multiplier using RCA

## Author

**Priyadharshan L**  
Electronics and Communication Engineering  
College of Engineering, Guindy, Anna University

---

## Introduction

A multiplier is one of the most important arithmetic blocks used in digital systems. It performs multiplication of two binary numbers and produces a product output. Multipliers are widely used in processors, DSP units, image processing systems, signal processing hardware, filters, and machine learning accelerators.

In digital VLSI design, the performance of a multiplier is very important because multiplication usually consumes more area, power, and delay compared to simple arithmetic operations such as addition and subtraction. Therefore, efficient multiplier architectures are used to reduce partial products, improve speed, and optimize area.

This project implements a **Radix-4 Modified Booth Multiplier** using Verilog. The design is verified through simulation and implemented using the **OpenLane RTL-to-GDS flow**.

---

## Project Overview

This project focuses on the design and implementation of an **8-bit signed Radix-4 Booth Multiplier**. The multiplier accepts two signed 8-bit inputs and produces a signed 16-bit product.

The design uses:

- Modified Booth Encoding
- Partial Product Generation
- Carry Save Adder based reduction
- Ripple Carry Adder for final addition
- OpenLane flow for physical design implementation

The final design was simulated and physically implemented using the SkyWater 130 nm standard cell library.

---

## What is a Multiplier?

A multiplier is a combinational arithmetic circuit used to multiply two binary numbers.

For two input numbers:

```text
X = Multiplicand
Y = Multiplier
Product = X × Y
```

Multipliers are critical components in various high-speed computational systems, including:
* **Digital Signal Processing (DSP)**
* **Microprocessors and ALUs**
* **FIR Filters**
* **Image Processing Hardware**
* **Embedded Systems**
* **ASIC and FPGA-based Accelerators**

### Why Booth Multiplication?
Standard binary multiplication generates one partial product for every multiplier bit (8 partial products for an 8-bit multiplier). Booth multiplication reduces this overhead:
1.  **Partial Product Reduction:** By encoding the multiplier bits, the number of partial products is reduced, improving speed and decreasing hardware complexity.
2.  **Signed Math:** Modified Booth Encoding efficiently handles 2’s complement numbers, making it ideal for signed multiplication.

---

## Project Structure

```text
Radix_4_rca/
├── src/
│     ├── booth_4.v        # Modified Booth Encoder
│     ├── ppg.v            # Partial Product Generator
│     ├── csa.v            # Carry Save Adder
│     ├── rca.v            # Ripple Carry Adder
│     └── multiplier_top.v # Top-level Module
├── sim_and_gds/
│     ├── radix4rca_waveform.png
│     ├── Radix_4_rca_klayout.png
├── config.json
├── pin_order.cfg
├── Openlane_results.md
├── sim_and_gds.md
└── README.md
```
## Future Work

The future implementation will focus on comparing different multiplier architectures and final adder choices.

- Planned extensions include:
   - Comparison of Radix-4 Booth Multiplier using RCA and CLA
   - Analysis of which final adder is better for Booth multiplier implementation
- Comparison based on:
  - Area
  - Power
  - Timing
  - Critical path delay
  - Routing complexity
  
- Implementation of a Radix-8 Booth Multiplier
- Testing Radix-8 with either RCA or CLA based on the best result obtained from the Radix-4 comparison

The goal is to identify the most efficient architecture for Booth multiplier implementation in terms of speed, area, and physical design quality.


