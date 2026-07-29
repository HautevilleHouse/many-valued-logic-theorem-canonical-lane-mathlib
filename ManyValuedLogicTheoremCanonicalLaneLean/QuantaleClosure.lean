import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.LatticeStructure

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure Quantale where
  carrier : Type u
  sup : set carrier → carrier
  multiplication : carrier → carrier → carrier
  sup_multiplication_left : ∀ (X : set carrier) (b : carrier), multiplication (sup X) b = sup {a | ∃ x ∈ X, multiplication x b = a}
  sup_multiplication_right : ∀ (a : carrier) (X : set carrier), multiplication a (sup X) = sup {b | ∃ x ∈ X, multiplication a x = b}
  multiplication_assoc : ∀ a b c, multiplication (multiplication a b) c = multiplication a (multiplication b c)

structure QuantaleEvidence (Q : Quantale) where
  sup_multiplication_left_closed : ∀ (X : set Q.carrier) (b : Q.carrier), Q.multiplication (Q.sup X) b = Q.sup {a | ∃ x ∈ X, Q.multiplication x b = a}
  sup_multiplication_right_closed : ∀ (a : Q.carrier) (X : set Q.carrier), Q.multiplication a (Q.sup X) = Q.sup {b | ∃ x ∈ X, Q.multiplication a x = b}
  multiplication_assoc_closed : ∀ a b c, Q.multiplication (Q.multiplication a b) c = Q.multiplication a (Q.multiplication b c)

def QuantaleClosed (Q : Quantale) : Prop :=
  (∀ (X : set Q.carrier) (b : Q.carrier), Q.multiplication (Q.sup X) b = Q.sup {a | ∃ x ∈ X, Q.multiplication x b = a}) ∧
  (∀ (a : Q.carrier) (X : set Q.carrier), Q.multiplication a (Q.sup X) = Q.sup {b | ∃ x ∈ X, Q.multiplication a x = b}) ∧
  (∀ a b c, Q.multiplication (Q.multiplication a b) c = Q.multiplication a (Q.multiplication b c))

theorem quantale_closed_from_evidence (Q : Quantale) (E : QuantaleEvidence Q) : QuantaleClosed Q := by
  exact And.intro E.sup_multiplication_left_closed (And.intro E.sup_multiplication_right_closed E.multiplication_assoc_closed)

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse