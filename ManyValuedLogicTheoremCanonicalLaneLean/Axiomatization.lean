import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.TruthValueStructure

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure AxiomatizationPackage (T : TruthValueSet) where
  axiomList : List (T.carrier → Prop)
  inferenceRules : List ((List (T.carrier → Prop)) → (T.carrier → Prop))
  consistent : Prop
  complete : Prop

def AxiomatizationClosed (T : TruthValueSet) (A : AxiomatizationPackage T) : Prop :=
  A.consistent ∧ A.complete

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
