# fhe-playground

Personal Lean 4 / Mathlib lab for formally stating and proving results in Fully Homomorphic Encryption.

Not a verified FHE implementation — a proof laboratory for the mathematics behind LWE-based schemes.

---

## Setup

Requires Lean 4 and Lake via `elan`:

```bash
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
```

Then:

```bash
lake update
lake exe cache get   # download prebuilt Mathlib (~2 hours without this)
lake build
```

---

## Structure

```
FhePlayground/
└── Basic.lean       — LWE types, encrypt/decrypt, encode/decode, correctness proof
```

---

## Theorem status

| Theorem | File | Status |
|---------|------|--------|
| `decode_encode` | Basic | ✓ proved |

---

## References

- Gentry (2009): [A Fully Homomorphic Encryption Scheme](https://crypto.stanford.edu/craig/craig-thesis.pdf)
- BV12: [FHE from Ring-LWE](https://eprint.iacr.org/2011/277)
- FV12 / BFV: [Somewhat Practical FHE](https://eprint.iacr.org/2012/144)
- TFHE: [Fast FHE over the Torus](https://eprint.iacr.org/2018/421)
- [Mathlib4 docs](https://leanprover-community.github.io/mathlib4_docs/)
