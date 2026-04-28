## Radix-4 Booth Multiplier Logic

A Radix-4 Booth Multiplier processes multiplier bits in **groups of three**, with one overlapping bit from the previous group. This generates one partial product for every two bits of the multiplier.

| Metric | Normal Multiplication | Radix-4 Booth Multiplication |
| :--- | :--- | :--- |
| **Partial Products (8-bit)** | 8 | 4 |
| **Reduction** | 0% | ~50% |

### Modified Booth Encoding Conditions
The encoder checks three bits at a time: `{Y[i+1], Y[i], Y[i-1]}`.

| Booth Bits | Operation | Description |
| :--- | :--- | :--- |
| **000** | 0 | No operation |
| **001** | +M | Add Multiplicand |
| **010** | +M | Add Multiplicand |
| **011** | +2M | Shift Left Multiplicand, then Add |
| **100** | -2M | Shift Left Multiplicand, then Subtract |
| **101** | -M | Subtract Multiplicand |
| **110** | -M | Subtract Multiplicand |
| **111** | 0 | No operation |

> **Note:** $M$ = Multiplicand. Generated partial products are shifted according to their group position.

---

## Block Diagram:

<p align="center">
  <img src="/Radix_4_rca/Radix4_rca_block.png" width="600"/>
  <img src="/Radix_4_CLA/Radix4_cla_block.png" width="600"/>
</p>

<p align="center"><b>Figure: Radix-4 Booth Multiplier Block Diagram having RCA and CLA as final adders</b></p>

---

## Implementation Files

### `booth_4.v`
This module performs Modified Booth Encoding. It takes the multiplier input and divides it into overlapping 3-bit groups. Each group is encoded into a Booth operation such as `0`, `+M`, `-M`, `+2M`, or `-2M`.

This block decides what type of partial product must be generated.

---

### `ppg.v`
This module is the Partial Product Generator. It receives the Booth encoded control signals from `booth_4.v` and generates the required partial products.

The generated partial products are based on the encoded operation:

```text
0, +M, -M, +2M, -2M
```

Each partial product is sign-extended and shifted according to its Booth group position.

---

## `csa.v`

This module implements the Carry Save Adder. The CSA is used to reduce multiple partial products without immediately propagating the carry.

Instead of producing one final sum directly, the CSA produces:

```text
Sum
Carry
```
This improves speed because carry propagation is delayed until the final addition stage.

## Final Adder Stage (rca.v vs cla.v)
`rca.v (Ripple Carry Adder)`
- Performs final addition of Sum and Carry from CSA
- Carry propagates sequentially from LSB to MSB
- Simple design, but slower due to linear carry propagation delay

`cla.v (Carry Lookahead Adder)`
- Replaces RCA in optimized design
- Uses Generate (G) and Propagate (P) signals to compute carries in parallel
- Significantly reduces carry propagation delay

### CLA Implementation
- 4-bit CLA blocks compute local carries
- A 16-bit CLA is formed by cascading four 4-bit CLA modules
- Carry signals (C1, C2, C3) are computed using lookahead logic instead of ripple


### Resulting Benefits
- Faster addition compared to RCA
- Improved overall multiplier performance
- Reduced critical path delay in the final stage


## multiplier_top.v
This is the top-level module of the design. It connects all the internal blocks together.
With RCA:
```
Inputs X and Y      
      ↓
Booth Encoder   
      ↓
Partial Product Generator  
      ↓
Carry Save Adder Reduction     
      ↓
Ripple Carry Adder      
      ↓
Final Product
```
With CLA:
```
Inputs X and Y      
      ↓
Booth Encoder   
      ↓
Partial Product Generator  
      ↓
Carry Save Adder Reduction     
      ↓
Ripple Carry Adder      
      ↓
Final Product
```
The only architectural change is in the final adder stage, where RCA is replaced with CLA to improve speed.
