import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.TruthValueAlgebra

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure TruthValueCompletenessPackage (A : TruthValueAlgebra) where
  designatedSet : Set A.carrier
  validFormulas : Set (A.carrier → A.carrier)
  completenessCondition : Prop
  soundnessCondition : Prop

structure TruthValueCompletenessEvidence {A : TruthValueAlgebra}
    (C : TruthValueCompletenessPackage A) where
  completeness_closed : C.completenessCondition
  soundness_closed : C.soundnessCondition

def TruthValueCompletenessClosed {A : TruthValueAlgebra}
    (C : TruthValueCompletenessPackage A) : Prop :=
  C.completenessCondition ∧ C.soundnessCondition

theorem truth_value_completeness_closed_from_evidence {A : TruthValueAlgebra}
    (C : TruthValueCompletenessPackage A) (E : TruthValueCompletenessEvidence C) :
    TruthValueCompletenessClosed C := by
  exact And.intro E.completeness_closed E.soundness_closed

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
