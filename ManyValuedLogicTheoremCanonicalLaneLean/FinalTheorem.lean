import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ManyValuedBridgeLemmas
import HautevilleHouse.ManyValuedLogicTheoremCanonicalLaneLean.ManyValuedGateLemmas

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

def ConstrainedManyValuedLogicClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_many_valued_logic_endgame (A : AdmissibleClass) :
    ConstrainedManyValuedLogicClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
