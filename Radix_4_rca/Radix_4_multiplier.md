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

*Figure: Radix-4 Booth Multiplier Architecture*

---
