import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ManyValuedTruthValues

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure ConnectivesPackage (T : ManyValuedTruthValues) where
  negation : T.truthValues → T.truthValues
  conjunction : T.truthValues → T.truthValues → T.truthValues
  disjunction : T.truthValues → T.truthValues → T.truthValues
  implication : T.truthValues → T.truthValues → T.truthValues
  negationDesignation : negation '' T.designated ⊆ T.undesignated
  conjunctionDesignation : (fun p q => conjunction p q) '' (T.designated × T.designated) ⊆ T.designated
  disjunctionDesignation : (fun p q => disjunction p q) '' (T.designated × T.designated) ⊆ T.designated
  implicationDesignation : (fun p q => implication p q) '' (T.designated × T.designated) ⊆ T.designated

structure ConnectivesEvidence {T : ManyValuedTruthValues} (C : ConnectivesPackage T) where
  negationDesignationClosed : C.negationDesignation
  conjunctionDesignationClosed : C.conjunctionDesignation
  disjunctionDesignationClosed : C.disjunctionDesignation
  implicationDesignationClosed : C.implicationDesignation

def ConnectivesClosed {T : ManyValuedTruthValues} (C : ConnectivesPackage T) : Prop :=
  C.negationDesignation ∧ C.conjunctionDesignation ∧ C.disjunctionDesignation ∧ C.implicationDesignation

theorem connectives_closed_from_evidence {T : ManyValuedTruthValues} (C : ConnectivesPackage T) (E : ConnectivesEvidence C) : ConnectivesClosed C :=
  by
    exact And.intro E.negationDesignationClosed (And.intro E.conjunctionDesignationClosed (And.intro E.disjunctionDesignationClosed E.implicationDesignationClosed))

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse