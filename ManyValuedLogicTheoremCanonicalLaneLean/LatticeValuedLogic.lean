import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ManyValuedTruthEvaluations

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure LatticeValuedStructure extends ManyValuedLogicStructure where
  latticeOrder : truthValueSet.carriers → truthValueSet.carriers → Prop
  meetOperation : truthValueSet.carriers → truthValueSet.carriers → truthValueSet.carriers
  joinOperation : truthValueSet.carriers → truthValueSet.carriers → truthValueSet.carriers
  topElement : truthValueSet.carriers
  bottomElement : truthValueSet.carriers
  latticeOrderReflexive : ∀ x, latticeOrder x x
  latticeOrderAntisymmetric : ∀ x y, latticeOrder x y → latticeOrder y x → x = y
  latticeOrderTransitive : ∀ x y z, latticeOrder x y → latticeOrder y z → latticeOrder x z
  meetIsInf : ∀ x y, latticeOrder (meetOperation x y) x ∧ latticeOrder (meetOperation x y) y ∧
    (∀ z, latticeOrder z x → latticeOrder z y → latticeOrder z (meetOperation x y))
  joinIsSup : ∀ x y, latticeOrder x (joinOperation x y) ∧ latticeOrder y (joinOperation x y) ∧
    (∀ z, latticeOrder x z → latticeOrder y z → latticeOrder (joinOperation x y) z)

def LatticeValuedLogicClosed (L : LatticeValuedStructure) : Prop :=
  ManyValuedLogicClosed L.toManyValuedLogicStructure ∧
  (∀ x y, L.latticeOrder x y ∨ L.latticeOrder y x)

theorem lattice_valued_logic_closed_from_structure (L : LatticeValuedStructure) :
    LatticeValuedLogicClosed L := by
  refine And.intro (many_valued_logic_closed_from_evidence L.toManyValuedLogicStructure
    { valuationWellDefinedClosed := L.valuationWellDefined
      valuationCompositionClosed := L.valuationComposition }) ?_
  sorry

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
