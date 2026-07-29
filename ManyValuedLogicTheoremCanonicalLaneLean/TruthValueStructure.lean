import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure TruthValueSet where
  carrier : Type u
  order : carrier → carrier → Prop
  meet : carrier → carrier → carrier
  join : carrier → carrier → carrier
  top : carrier
  bottom : carrier
  top_meet : ∀ x : carrier, meet top x = x
  bottom_join : ∀ x : carrier, join bottom x = x
  meet_comm : ∀ x y : carrier, meet x y = meet y x
  join_comm : ∀ x y : carrier, join x y = join y x

def FiniteTruthValueSet (T : TruthValueSet) : Prop :=
  Finite T.carrier

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse
