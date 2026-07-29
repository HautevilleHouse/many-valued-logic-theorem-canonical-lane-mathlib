import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.TruthValueStructure

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure FiniteValuedCompletenessPackage (T : TruthValueSet) where
  completeness : Prop
  soundness : Prop
  finiteModelProperty : Prop

def FiniteValuedCompletenessClosed (T : TruthValueSet) (P : FiniteValuedCompletenessPackage T) : Prop :=
  P.completeness ∧ P.soundness ∧ P.finiteModelProperty

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
