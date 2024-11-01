/-
Copyright (c) 2023 Bhavik Mehta. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Bhavik Mehta
-/
import Mathlib.Data.Nat.Factorial.Basic

#align_import prereq.mathlib.data.nat.factorial.basic

/-!
# Stuff for data.nat.factorial.basic
-/


namespace Nat

theorem asc_le_pow_mul_factorial {s t : ℕ} : (t + 1).ascFactorial s ≤ s.factorial * (t + 1) ^ s := by
  induction' s with s ih
  · simp
  rw [ascFactorial_succ, factorial_succ, pow_succ', mul_mul_mul_comm]
  refine' Nat.mul_le_mul _ ih
  rw [add_comm (t + 1), add_one_mul s, mul_add_one, add_assoc]
  simp

theorem asc_le_pow_mul_factorial' {s t : ℕ} : t.ascFactorial s ≤ s.factorial * t ^ s := by
  cases t
  case zero =>
    cases s
    case zero => simp
    case succ t => simp [zero_ascFactorial]
  case succ t => exact asc_le_pow_mul_factorial

-- theorem asc_le_pow_mul_factorial'' {s t : ℕ} : t.ascFactorial s ≤ s.factorial * t ^ s := by
theorem asc_le_pow_mul_factorial'' (t : ℕ) : (s : ℕ) → t.ascFactorial s ≤ s.factorial * t ^ s
  | 0 => by simp
  | 1 => by simp [ascFactorial_succ]
  | (s + 2) => by
      rw [ascFactorial_succ, factorial_succ, pow_succ', mul_mul_mul_comm]
      cases' t
      · simp [zero_ascFactorial]
      · refine Nat.mul_le_mul ?_ (asc_le_pow_mul_factorial'' _ (s + 1))
        rw [add_comm, add_one_mul (s + 1), add_le_add_iff_right]
        exact le_mul_of_pos_right (succ_pos _)

end Nat
