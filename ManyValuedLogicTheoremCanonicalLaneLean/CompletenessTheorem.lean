import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ManyValuedTruthValues
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ConnectivesPackage
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.SatisfactionRelation

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure CompletenessPackage {T : ManyValuedTruthValues} {C : ConnectivesPackage T} (S : SatisfiabilityPackage T C) where
  proofSystem : Type u
  theorems : Set S.formulaType
  soundness : ∀ (φ : S.formulaType), φ ∈ theorems → φ ∈ S.designatedFormulas
  completeness : ∀ (φ : S.formulaType), φ ∈ S.designatedFormulas → φ ∈ theorems

structure CompletenessEvidence {T : ManyValuedTruthValues} {C : ConnectivesPackage T} {S : SatisfiabilityPackage T C} (Cp : CompletenessPackage S) where
  soundnessClosed : Cp.soundness
  completenessClosed : Cp.completeness

def CompletenessClosed {T : ManyValuedTruthValues} {C : ConnectivesPackage T} {S : SatisfiabilityPackage T C} (Cp : CompletenessPackage S) : Prop :=
  Cp.soundness ∧ Cp.completeness

theorem completeness_closed_from_evidence {T : ManyValuedTruthValues} {C : ConnectivesPackage T} {S : SatisfiabilityPackage T C} (Cp : CompletenessPackage S) (E : CompletenessEvidence Cp) : CompletenessClosed Cp :=
  by
    exact And.intro E.soundnessClosed E.completenessClosed

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse