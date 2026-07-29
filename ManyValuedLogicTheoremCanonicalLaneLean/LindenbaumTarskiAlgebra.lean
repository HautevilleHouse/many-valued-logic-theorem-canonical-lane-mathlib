import ManyValuedLogicTheoremCanonicalLaneLean.TruthValueAlgebra

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure LindenbaumTarskiAlgebra (n : ℕ) where
  formulas : Type u
  equivalenceClass : formulas → formulas → Prop
  algebra : TruthValueAlgebra n
  congruence : ∀ f g h, equivalenceClass f g → equivalenceClass (A.algebra.impl f h) (A.algebra.impl g h)

def lindenbaumTarskiAlgebraClosed {n : ℕ} (L : LindenbaumTarskiAlgebra n) : Prop :=
  (∀ f, L.equivalenceClass f f) ∧
  (∀ f g, L.equivalenceClass f g → L.equivalenceClass g f) ∧
  (∀ f g h, L.equivalenceClass f g → L.equivalenceClass g h → L.equivalenceClass f h) ∧
  L.congruence

theorem lindenbaum_tarski_algebra_closed_intro {n : ℕ} (L : LindenbaumTarskiAlgebra n)
    (h_refl : ∀ f, L.equivalenceClass f f)
    (h_symm : ∀ f g, L.equivalenceClass f g → L.equivalenceClass g f)
    (h_trans : ∀ f g h, L.equivalenceClass f g → L.equivalenceClass g h → L.equivalenceClass f h)
    (h_congr : ∀ f g h, L.equivalenceClass f g → L.equivalenceClass (L.algebra.impl f h) (L.algebra.impl g h)) :
    lindenbaumTarskiAlgebraClosed L :=
  And.intro h_refl (And.intro h_symm (And.intro h_trans h_congr))

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse