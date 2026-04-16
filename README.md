# fhe-playground

Personal scratchpad for exploring Fully Homomorphic Encryption in Lean 4.

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
