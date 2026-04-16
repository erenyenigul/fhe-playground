# fhe-playground

Personal scratchpad for exploring Fully Homomorphic Encryption in Lean 4.

I'm using Lean as a way to understand FHE more deeply — forcing myself to state things precisely enough that a proof assistant accepts them. The goal isn't to build anything production-ready, just to get a clearer picture of how LWE-based schemes actually work under the hood.

---

## Setup

You need Lean 4 and Lake. Install via `elan`:

```bash
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
```

Then clone and build:

```bash
lake update
lake exe cache get   # skip this and you'll wait ~2 hours for Mathlib to compile
lake build
```

---

## What's here

```
FhePlayground/
├── Defs.lean         — types, encrypt, decrypt, encode, decode
├── Correctness.lean  — correctness theorems
├── Noise.lean        — noise model and bounds
└── Scratch.lean      — experiments and works-in-progress
```

Just getting started. More to come as I dig deeper.

---

## Reading list

- Gentry (2009): [A Fully Homomorphic Encryption Scheme](https://crypto.stanford.edu/craig/craig-thesis.pdf) — the original
- BV12: [FHE from Ring-LWE](https://eprint.iacr.org/2011/277)
- FV12 / BFV: [Somewhat Practical FHE](https://eprint.iacr.org/2012/144) — noise model I'm working from
- TFHE: [Fast FHE over the Torus](https://eprint.iacr.org/2018/421)
- [Mathlib4 docs](https://leanprover-community.github.io/mathlib4_docs/)
