import Lake
open Lake DSL

package «FhePlayground» where
  -- add package configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4"

@[default_target]
lean_lib «FhePlayground» where
  -- add library configuration options here
