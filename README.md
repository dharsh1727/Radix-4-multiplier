# Radix-4 Booth Multiplier (RCA – OpenLane | CLA – Cadence)

## Author

**Priyadharshan L**  
Electronics and Communication Engineering  
College of Engineering, Guindy, Anna University

---

## Introduction

A multiplier is one of the most important arithmetic blocks used in digital systems. It performs multiplication of two binary numbers and produces a product output. Multipliers are widely used in processors, DSP units, image processing systems, signal processing hardware, filters, and machine learning accelerators.

In digital VLSI design, multiplier performance is critical since multiplication typically consumes more area, power, and delay compared to basic arithmetic operations. Efficient architectures are therefore required to reduce partial products, improve speed, and optimize hardware utilization.

This project implements a **Radix-4 Modified Booth Multiplier** in Verilog and evaluates two different final adder architectures:
- **RCA-based design implemented using OpenLane (Sky130 PDK)**
- **CLA-based design implemented using Cadence tools (Genus & Innovus)**

---

## Project Overview

This project focuses on the design and implementation of an **8-bit signed Radix-4 Booth Multiplier**. The multiplier takes two signed 8-bit inputs and produces a signed 16-bit output.

The design flow includes:

- Modified Booth Encoding  
- Partial Product Generation  
- Carry Save Adder (CSA) Reduction  
- Final Adder Stage:
  - **RCA (OpenLane implementation)**
  - **CLA (Cadence implementation)**  

The RCA-based design emphasizes full open-source ASIC flow, while the CLA-based design focuses on high-speed optimization using industry-standard tools.

---

## Tools Used

### RCA Implementation (OpenLane Flow)
- **Vivado** – Functional simulation and verification  
- **OpenLane (Sky130 PDK)** – RTL-to-GDSII ASIC flow  

### CLA Implementation (Cadence Flow)
- **Cadence Genus** – Synthesis  
- **Cadence Innovus** – Physical Design (PnR, DRC, Routing)  

---

## What is a Multiplier?

A multiplier is a combinational arithmetic circuit used to multiply two binary numbers.

```text
X = Multiplicand
Y = Multiplier
Product = X × Y
````

Multipliers are critical components in:

* Digital Signal Processing (DSP)
* Microprocessors and ALUs
* FIR Filters
* Image Processing Hardware
* Embedded Systems
* ASIC and FPGA-based Accelerators

---

## Why Booth Multiplication?

Standard binary multiplication generates one partial product per multiplier bit (8 for an 8-bit multiplier). Booth multiplication reduces this overhead:

* **Partial Product Reduction:** Reduces partial products, improving speed and lowering hardware complexity
* **Signed Arithmetic Support:** Efficient handling of 2’s complement numbers

---

## Project Structure

```text
Radix_4_rca/
├── src/
│     ├── booth_4.v        # Modified Booth Encoder
│     ├── ppg.v            # Partial Product Generator
│     ├── csa.v            # Carry Save Adder
│     ├── rca.v            # Ripple Carry Adder (OpenLane)
│     └── multiplier_top.v # Top-level Module
├── sim_and_gds/
│     ├── radix4rca_waveform.png
│     ├── Radix_4_rca_klayout.png
├── config.json
├── pin_order.cfg
├── Openlane_results.md
└── README.md
```

```text
Radix_4_CLA/
├── src/
│     ├── booth_4.v        # Modified Booth Encoder
│     ├── ppg.v            # Partial Product Generator
│     ├── csa.v            # Carry Save Adder
│     ├── cla.v            # Carry Lookahead Adder (Cadence)
│     └── multiplier_top.v # Top-level Module
├── sim and gds/
│     ├── Output_waveform.png
│     ├── Timing_report.png
│     ├── Floorplanning.png
│     ├── Placement.png
│     ├── Routing.jpg
│     ├── DRC.png
│     ├── area_genus.jpg
│     ├── area_innovus.png
├── Cadence_results.md
└── README.md
```

---

## Implementation Approach

### RCA-Based Design (OpenLane)

* Final addition performed using **Ripple Carry Adder**
* Simpler architecture with sequential carry propagation
* Implemented using full open-source ASIC flow
* Provides insights into area, routing, and physical design constraints

### CLA-Based Design (Cadence)

* Final addition replaced with **Carry Lookahead Adder**
* Parallel carry computation using Generate and Propagate signals
* Implemented using **Cadence Genus and Innovus**
* Achieves improved timing performance and reduced critical path delay

---

## Future Work

The next phase of the project focuses on architectural comparison and optimization:

* Compare **RCA vs CLA** within Booth multiplier framework

* Evaluate trade-offs in:

  * Area
  * Power
  * Timing
  * Critical path delay
  * Routing complexity

* Extend the design to **Radix-8 Booth Multiplier**

* Implement Radix-8 with both RCA and CLA

* Identify the most optimal architecture for high-speed ASIC implementations

---

## Conclusion

This project demonstrates a complete design exploration of a Radix-4 Booth Multiplier using two different implementation methodologies:

* **OpenLane (RCA)** for full open-source RTL-to-GDS flow
* **Cadence (CLA)** for high-performance industrial design flow

The comparison provides practical insights into arithmetic circuit optimization, final adder impact, and ASIC design trade-offs.

```
```
