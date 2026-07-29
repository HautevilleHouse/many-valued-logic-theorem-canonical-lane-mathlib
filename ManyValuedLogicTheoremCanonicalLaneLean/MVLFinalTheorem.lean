import ManyValuedLogicTheoremCanonicalLaneLean.ManyValuedGateLemmas

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

def ConstrainedManyValuedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_many_valued_endgame (A : AdmissibleClass) :
    ConstrainedManyValuedClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse