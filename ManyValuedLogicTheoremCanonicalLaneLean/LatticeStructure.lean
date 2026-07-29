import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure MVLattice where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  join_comm : ∀ a b, join a b = join b a
  meet_comm : ∀ a b, meet a b = meet b a
  join_assoc : ∀ a b c, join (join a b) c = join a (join b c)
  meet_assoc : ∀ a b c, meet (meet a b) c = meet a (meet b c)
  absorption : ∀ a b, meet a (join a b) = a
  join_meet_absorption : ∀ a b, join a (meet a b) = a

structure MVLatticeEvidence (L : MVLattice) where
  join_comm_closed : ∀ a b, L.join a b = L.join b a
  meet_comm_closed : ∀ a b, L.meet a b = L.meet b a
  join_assoc_closed : ∀ a b c, L.join (L.join a b) c = L.join a (L.join b c)
  meet_assoc_closed : ∀ a b c, L.meet (L.meet a b) c = L.meet a (L.meet b c)
  absorption_closed : ∀ a b, L.meet a (L.join a b) = a
  join_meet_absorption_closed : ∀ a b, L.join a (L.meet a b) = a

def MVLatticeClosed (L : MVLattice) : Prop :=
  (∀ a b, L.join a b = L.join b a) ∧
  (∀ a b, L.meet a b = L.meet b a) ∧
  (∀ a b c, L.join (L.join a b) c = L.join a (L.join b c)) ∧
  (∀ a b c, L.meet (L.meet a b) c = L.meet a (L.meet b c)) ∧
  (∀ a b, L.meet a (L.join a b) = a) ∧
  (∀ a b, L.join a (L.meet a b) = a)

theorem mvlattice_closed_from_evidence (L : MVLattice) (E : MVLatticeEvidence L) : MVLatticeClosed L := by
  exact And.intro E.join_comm_closed (And.intro E.meet_comm_closed (And.intro E.join_assoc_closed (And.intro E.meet_assoc_closed (And.intro E.absorption_closed E.join_meet_absorption_closed))))

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse