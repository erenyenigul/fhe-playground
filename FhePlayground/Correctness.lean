import FhePlayground.Defs

-- Encoding round-trips: decode (encode i) = i when k ∣ q
theorem decode_encode (k q : ℕ) (i : ZMod k) (hk : k ∣ q) (hk_pos : 0 < k) (hq : 0 < q) :
    decode q k (encode q k i) = i := by
  obtain ⟨d, hd⟩ := hk; subst hd
  have hd_pos : 0 < d := by cases d <;> simp_all
  haveI : NeZero k := ⟨by omega⟩
  haveI : NeZero (k * d) := ⟨by omega⟩
  simp only [decode, encode, Nat.mul_div_cancel_left d hk_pos]
  rw [← Nat.cast_mul, ZMod.val_natCast,
      Nat.mod_eq_of_lt ((Nat.mul_lt_mul_right hd_pos).mpr (ZMod.val_lt i)),
      (by ring : 2 * (i.val * d) * k + k * d = k * d * (2 * i.val + 1)),
      (by ring : 2 * (k * d) = k * d * 2),
      ← Nat.div_div_eq_div_mul, Nat.mul_div_cancel_left _ hq,
      (by omega : (2 * i.val + 1) / 2 = i.val)]
  exact ZMod.natCast_zmod_val i
