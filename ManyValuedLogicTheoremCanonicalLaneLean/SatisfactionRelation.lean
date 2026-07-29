import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ManyValuedTruthValues
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ConnectivesPackage

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure Valuation (T : ManyValuedTruthValues) where
  varValues : String → T.truthValues

structure SatisfiabilityPackage (T : ManyValuedTruthValues) (C : ConnectivesPackage T) where
  formulaType : Type u
  eval : formulaType → Valuation T → T.truthValues
  evalNegation : ∀ (φ : formulaType) (v : Valuation T), eval (fNeg φ) v = C.negation (eval φ v)
  evalConjunction : ∀ (φ ψ : formulaType) (v : Valuation T), eval (fConj φ ψ) v = C.conjunction (eval φ v) (eval ψ v)
  evalDisjunction : ∀ (φ ψ : formulaType) (v : Valuation T), eval (fDisj φ ψ) v = C.disjunction (eval φ v) (eval ψ v)
  evalImplication : ∀ (φ ψ : formulaType) (v : Valuation T), eval (fImpl φ ψ) v = C.implication (eval φ v) (eval ψ v)
  designatedFormulas : Set formulaType
  designatedCondition : ∀ (φ : formulaType), φ ∈ designatedFormulas ↔ eval φ ∈ T.designated
  where
    fNeg : formulaType → formulaType
    fConj : formulaType → formulaType → formulaType
    fDisj : formulaType → formulaType → formulaType
    fImpl : formulaType → formulaType → formulaType

structure SatisfiabilityEvidence {T : ManyValuedTruthValues} {C : ConnectivesPackage T} (S : SatisfiabilityPackage T C) where
  evalNegationClosed : S.evalNegation
  evalConjunctionClosed : S.evalConjunction
  evalDisjunctionClosed : S.evalDisjunction
  evalImplicationClosed : S.evalImplication
  designatedConditionClosed : S.designatedCondition

def SatisfiabilityClosed {T : ManyValuedTruthValues} {C : ConnectivesPackage T} (S : SatisfiabilityPackage T C) : Prop :=
  S.evalNegation ∧ S.evalConjunction ∧ S.evalDisjunction ∧ S.evalImplication ∧ S.designatedCondition

theorem satisfiability_closed_from_evidence {T : ManyValuedTruthValues} {C : ConnectivesPackage T} (S : SatisfiabilityPackage T C) (E : SatisfiabilityEvidence S) : SatisfiabilityClosed S :=
  by
    exact And.intro E.evalNegationClosed (And.intro E.evalConjunctionClosed (And.intro E.evalDisjunctionClosed (And.intro E.evalImplicationClosed E.designatedConditionClosed)))

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse