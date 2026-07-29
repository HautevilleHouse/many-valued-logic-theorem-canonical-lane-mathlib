import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ManyValuedTruthEvaluations

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ManyValuedLogicClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
