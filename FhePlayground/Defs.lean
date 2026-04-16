import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Matrix.Basic
import Mathlib.Probability.Distributions.Gaussian.Basic

variable (n q k σ : ℕ)

abbrev EncryptionKey := Fin n → ZMod q
abbrev Plaintext := ZMod q

structure Ciphertext where
  a : Fin n → ZMod q
  b : ZMod q

def encrypt (m : Plaintext q) (s : EncryptionKey n q) (a : Fin n → ZMod q) (e : ZMod q)
    : Ciphertext n q :=
  { a := a, b := dotProduct a s + m + e }

def decrypt (ct : Ciphertext n q) (s : EncryptionKey n q) : Plaintext q :=
  ct.b - dotProduct ct.a s

def encode (i : ZMod k) : ZMod q := i.val * (q / k : ℕ)

def decode (m : ZMod q) : ZMod k :=
  let num := 2 * m.val * k + q
  let denom := 2 * q
  ((num / denom : ℕ) : ZMod k)
