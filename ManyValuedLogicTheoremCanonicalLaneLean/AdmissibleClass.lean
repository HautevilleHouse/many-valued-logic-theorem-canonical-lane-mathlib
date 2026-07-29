import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure ManyValuedLogicAdmittedObject where
  algebra : TruthValueAlgebra
  completeness : TruthValueCompletenessPackage algebra

def ManyValuedLogicWitnessClosed (O : ManyValuedLogicAdmittedObject) : Prop :=
  TruthValueCompletenessClosed O.completeness

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
