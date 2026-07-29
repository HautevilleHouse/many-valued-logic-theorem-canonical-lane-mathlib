import ManyValuedLogicTheoremCanonicalLaneLean.ManyValuedLogicAdmissibleClass

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure TruthValueAlgebra (n : ℕ) where
  elements : Fin n → Type
  meet : elements i → elements j → elements (min i j)
  join : elements i → elements j → elements (max i j)
  negation : elements i → elements (n-1-i)
  impl : elements i → elements j → elements (max (n-1-i) j)

def truthValueAlgebraClosed {n : ℕ} (A : TruthValueAlgebra n) : Prop :=
  (∀ i j x y, A.meet (A.meet x y) y = A.meet x y) ∧
  (∀ i j x y, A.join (A.join x y) y = A.join x y) ∧
  (∀ i x, A.negation (A.negation x) = x) ∧
  (∀ i j x y, A.impl x y = A.join (A.negation x) y)

theorem truth_value_algebra_closed_intro {n : ℕ} (A : TruthValueAlgebra n)
    (h1 : ∀ i j x y, A.meet (A.meet x y) y = A.meet x y)
    (h2 : ∀ i j x y, A.join (A.join x y) y = A.join x y)
    (h3 : ∀ i x, A.negation (A.negation x) = x)
    (h4 : ∀ i j x y, A.impl x y = A.join (A.negation x) y) :
    truthValueAlgebraClosed A :=
  And.intro h1 (And.intro h2 (And.intro h3 h4))

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse