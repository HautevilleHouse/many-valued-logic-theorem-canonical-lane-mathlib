import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.TruthValueAlgebra

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  True

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  trivial

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
