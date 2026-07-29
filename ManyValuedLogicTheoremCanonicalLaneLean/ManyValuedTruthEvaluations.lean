import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure TruthValueSet where
  carriers : Type u
  truthValues : List carriers
  designatedValues : List carriers
  negation : carriers → carriers
  conjunction : carriers → carriers → carriers
  disjunction : carriers → carriers → carriers
  implication : carriers → carriers → carriers
  negationClosure : ∀ x, negation (negation x) = x
  conjunctionClosure : ∀ x y, conjunction x y = conjunction y x
  disjunctionClosure : ∀ x y, disjunction x y = disjunction y x
  implicationClosure : ∀ x y, implication x y = disjunction (negation x) y

structure ManyValuedLogicStructure where
  truthValueSet : TruthValueSet
  valuationSpace : Type v
  valuationFunction : valuationSpace → (truthValueSet.carriers → truthValueSet.carriers)
  valuationWellDefined : Prop
  valuationComposition : Prop

structure ManyValuedLogicEvidence (M : ManyValuedLogicStructure) where
  valuationWellDefinedClosed : M.valuationWellDefined
  valuationCompositionClosed : M.valuationComposition

def ManyValuedLogicClosed (M : ManyValuedLogicStructure) : Prop :=
  M.valuationWellDefined ∧ M.valuationComposition

theorem many_valued_logic_closed_from_evidence (M : ManyValuedLogicStructure) (E : ManyValuedLogicEvidence M) :
    ManyValuedLogicClosed M := by
  exact And.intro E.valuationWellDefinedClosed E.valuationCompositionClosed

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
