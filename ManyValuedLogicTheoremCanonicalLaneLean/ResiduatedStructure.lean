import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure ResiduatedMV where
  carrier : Type u
  multiplication : carrier → carrier → carrier
  residuation : carrier → carrier → carrier
  multiplication_assoc : ∀ a b c, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  left_residuation : ∀ a b c, multiplication a b ≤ c ↔ b ≤ residuation a c
  right_residuation : ∀ a b c, multiplication a b ≤ c ↔ a ≤ residuation b c

def ResiduatedMVClosed (R : ResiduatedMV) : Prop := R.multiplication_assoc

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse