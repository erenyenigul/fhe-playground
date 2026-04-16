import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Matrix.Basic
import Mathlib.Probability.Distributions.Gaussian.Basic
import Mathlib.Data.Matrix.Basic

variable (n q k σ : ℕ)
  (hk : k ∣ q)
  (hk_pos : 0 < k)

abbrev EncryptionKey := Fin n → ZMod q
abbrev Plaintext := ZMod q

structure Ciphertext where
  a : Fin n → ZMod q
  b : ZMod q

def encrypt (m: Plaintext q)
            (s: EncryptionKey n q)
            (a: Fin n → ZMod q)
            (e: ZMod q) -- noise
            : Ciphertext n q :=
            { a := a
              b := dotProduct a s + m + e  }

def decrypt (ciphertext: Ciphertext n q)
            (s: EncryptionKey n q)
            : Plaintext q :=
            ciphertext.b - dotProduct ciphertext.a s

def encode (i: ZMod k): ZMod q := i.val * (q / k: ℕ)
def decode (m : ZMod q) : ZMod k :=
  let num := 2 * m.val * k + q
  let denom := 2 * q
  ((num / denom : Nat) : ZMod k)

theorem decode_encode (i : ZMod k) (hk : k ∣ q) (hk_pos : 0 < k) (hq : 0 < q) :
  decode q k (encode q k i) = i := by
  obtain ⟨d, hd⟩ := hk; subst hd
  have hd_pos : 0 < d := by cases d <;> simp_all
  have hkd_pos : 0 < k * d := Nat.mul_pos hk_pos hd_pos
  haveI : NeZero k := ⟨by omega⟩
  haveI : NeZero (k * d) := ⟨by omega⟩
  simp only [decode, encode, Nat.mul_div_cancel_left d hk_pos]
  have hval : (↑i.val * ↑d : ZMod (k * d)).val = i.val * d := by
    rw [← Nat.cast_mul, ZMod.val_natCast,
        Nat.mod_eq_of_lt ((Nat.mul_lt_mul_right hd_pos).mpr (ZMod.val_lt i))]
  rw [hval,
      (by ring : 2 * (i.val * d) * k + k * d = k * d * (2 * i.val + 1)),
      (by ring : 2 * (k * d) = k * d * 2),
      ← Nat.div_div_eq_div_mul, Nat.mul_div_cancel_left _ hkd_pos,
      (by omega : (2 * i.val + 1) / 2 = i.val)]
  exact ZMod.natCast_zmod_val i
