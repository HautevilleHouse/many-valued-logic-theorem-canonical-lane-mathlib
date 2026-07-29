import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.TruthValueAlgebra

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure LogicalOperationPackage (A : TruthValueAlgebra) where
  implication : A.carrier → A.carrier → A.carrier
  equivalence : A.carrier → A.carrier → A.carrier
  implication_property : ∀ a b : A.carrier, implication a b = A.disj (A.neg a) b
  equivalence_property : ∀ a b : A.carrier, equivalence a b = A.conj (implication a b) (implication b a)

structure LogicalOperationEvidence {A : TruthValueAlgebra} (P : LogicalOperationPackage A) where
  implication_closed : ∀ a b : A.carrier, P.implication a b = A.disj (A.neg a) b
  equivalence_closed : ∀ a b : A.carrier, P.equivalence a b = A.conj (P.implication a b) (P.implication b a)

def LogicalOperationClosed {A : TruthValueAlgebra} (P : LogicalOperationPackage A) : Prop :=
  ∀ a b : A.carrier, P.implication a b = A.disj (A.neg a) b ∧
  P.equivalence a b = A.conj (P.implication a b) (P.implication b a)

theorem logical_operation_closed_from_evidence {A : TruthValueAlgebra}
    (P : LogicalOperationPackage A) (E : LogicalOperationEvidence P) :
    LogicalOperationClosed P := by
  intro a b
  exact And.intro (E.implication_closed a b) (E.equivalence_closed a b)

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
