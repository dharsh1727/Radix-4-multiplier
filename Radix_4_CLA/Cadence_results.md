# Radix-4 Booth Multiplier using CLA – Cadence Results

## Simulation Results in Cadence

---

## Timing Analysis

<p align="center">
  <img src="sim and gds/Timing_report.png" width="700"/>
</p>

<p align="center"><b>Fig.4 Timing Report</b></p>

The timing analysis of the synthesized design (Booth_CLA_Top) was performed after implementation. The report shows successful timing closure with no violations.

### Key Parameters from Report
- Startpoint: X[1]  
- Endpoint: Product[15]  
- Path Delay: 10000 ps  
- Data Path Delay: 1278 ps  
- Required Time: 10000 ps  
- Slack: +8722 ps  

### Delay Analysis
- The data path delay (1278 ps) represents the actual combinational delay through logic gates.  
- The large positive slack (8722 ps) indicates that the signal arrives much earlier than required.  

### Setup Time
- Since slack is positive, the setup time constraint is satisfied.  
- No setup violations are observed in the design.  

### Hold Time
- No hold violations are reported in the analysis.  
- This implies stable data propagation without early arrival issues.  

### Detailed Path Observation
- The critical path consists of logic gates such as NOR, INV, AOI, and ADDER (Full Adders from CLA).  
- Delay accumulation is gradual across stages, indicating an optimized datapath.  

### Overall Performance
- Timing Violations: 0  
- Warnings: 0  
- The design is timing clean and optimized for the given constraints.  

---

## Physical Design Verification Report (Innovus)

### Connectivity Verification

<p align="center">
  <img src="sim and gds/DRC.png" width="700"/>
</p>

<p align="center"><b>Fig.5 Connectivity Verification and DRC</b></p>

The connectivity verification process was performed using the Innovus verification engine to ensure proper net connections.

- No connectivity violations  
- No warnings detected  
- All nets are properly routed and connected  

This confirms that the design is electrically consistent and free from connectivity-related issues.

---

### Design Rule Check (DRC)

- DRC initialization and verification completed successfully  
- Entire design area was analyzed  
- 0 violations reported  

This indicates that the layout adheres to all fabrication rules and is safe for manufacturing.

---

## Area Report

<p align="center">
  <img src="sim and gds/area_genus.jpg" width="500"/>
  <img src="sim and gds/area_innovus.png" width="500"/>
</p>

<p align="center"><b>Fig.6 Area Report from Genus and Innovus</b></p>

The area of the Booth_CLA_Top design was analyzed at synthesis and physical design stages.

### Key Results

**Synthesis (Genus):**
- Total Area: 1073.284  
- CLA Submodule Area: 262.644  
- Instance Count: 195  

**Physical Design (Innovus):**
- Total Area: 374.49 µm²  
- CLA Submodule Area: 92.682 µm²  
- Instance Count: 195  

The reduction in area from synthesis to physical design is due to placement and routing optimizations.

---

## Floorplanning

<p align="center">
  <img src="sim and gds/Floorplanning.png" width="600"/>
</p>

<p align="center"><b>Fig.7 Floorplanning</b></p>

The floorplan shows the core region placed within the chip boundary with minimal routing, representing the initial stage of physical design.

---

## Placement (PnR - Pre-routing)

<p align="center">
  <img src="sim and gds/Placement.png" width="600"/>
</p>

<p align="center"><b>Fig.8 Placement (Pre-routing)</b></p>

During placement, standard cells are positioned within the core area.

- Blue lines (flylines) represent unrouted connections  
- Indicates placement completed, routing not yet performed  
- Helps minimize wirelength and improve performance  

---

## Routing (PnR - Final Stage)

<p align="center">
  <img src="sim and gds/Routing.jpg" width="600"/>
</p>

<p align="center"><b>Fig.9 Routing</b></p>

Routing completes all physical interconnections.

- Dense interconnections across multiple metal layers  
- No flylines present  
- All nets successfully routed  

This stage ensures full connectivity and prepares the design for signoff.

---

## Inference

The implementation of the Radix-4 Booth Multiplier with Carry Lookahead Adder (CLA) significantly reduces propagation delay, improving overall performance.

- Large positive slack indicates over-performance  
- No setup or hold violations  
- Robust and reliable timing behavior  

The CLA reduces carry propagation delay, while Booth encoding minimizes partial products, enhancing computational efficiency.

---

## Final Observation

The design is:

- Functionally correct  
- Timing optimized  
- Suitable for high-speed applications  
