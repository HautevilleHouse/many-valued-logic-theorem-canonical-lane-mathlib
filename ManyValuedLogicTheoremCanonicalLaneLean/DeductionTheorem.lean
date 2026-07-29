import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ManyValuedTruthValues
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ConnectivesPackage
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.SatisfactionRelation
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.CompletenessTheorem

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure DeductionPackage {T : ManyValuedTruthValues} {C : ConnectivesPackage T} {S : SatisfiabilityPackage T C} (Cp : CompletenessPackage S) where
  deductionRule : ∀ (Γ : Set S.formulaType) (φ ψ : S.formulaType),
    (∀ (v : Valuation T), (∀ (γ ∈ Γ), S.eval γ v ∈ T.designated) → S.eval (S.fImpl φ ψ) v ∈ T.designated) →
    (∀ (v : Valuation T), (∀ (γ ∈ Γ), S.eval γ v ∈ T.designated) → S.eval ψ v ∈ T.designated)
  deductionRuleClosed : deductionRule

structure DeductionEvidence {T : ManyValuedTruthValues} {C : ConnectivesPackage T} {S : SatisfiabilityPackage T C} {Cp : CompletenessPackage S} (D : DeductionPackage Cp) where
  deductionRuleClosed : D.deductionRuleClosed

def DeductionClosed {T : ManyValuedTruthValues} {C : ConnectivesPackage T} {S : SatisfiabilityPackage T C} {Cp : CompletenessPackage S} (D : DeductionPackage Cp) : Prop :=
  D.deductionRuleClosed

theorem deduction_closed_from_evidence {T : ManyValuedTruthValues} {C : ConnectivesPackage T} {S : SatisfiabilityPackage T C} {Cp : CompletenessPackage S} (D : DeductionPackage Cp) (E : DeductionEvidence D) : DeductionClosed D :=
  by
    exact E.deductionRuleClosed

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse