import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure ManyValuedTruthValues where
  truthValues : Type u
  designated : Set truthValues
  undesignated : Set truthValues
  partitionProof : designated ∪ undesignated = Set.univ ∧ designated ∩ undesignated = ∅

structure ManyValuedTruthValuesEvidence (T : ManyValuedTruthValues) where
  designatedNonempty : Set.Nonempty T.designated
  undesignatedNonempty : Set.Nonempty T.undesignated
  partitionClosed : T.partitionProof

def ManyValuedTruthValuesClosed (T : ManyValuedTruthValues) : Prop :=
  Set.Nonempty T.designated ∧ Set.Nonempty T.undesignated ∧ T.partitionProof

theorem many_valued_truth_values_closed_from_evidence (T : ManyValuedTruthValues) (E : ManyValuedTruthValuesEvidence T) : ManyValuedTruthValuesClosed T :=
  by
    exact And.intro E.designatedNonempty (And.intro E.undesignatedNonempty E.partitionClosed)

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse