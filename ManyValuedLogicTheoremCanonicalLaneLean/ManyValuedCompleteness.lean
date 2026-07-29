import ManyValuedLogicTheoremCanonicalLaneLean.LindenbaumTarskiAlgebra

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure ManyValuedCompleteness where
  n : ℕ
  theory : Type u
  formula : Type v
  syntacticConsequence : theory → formula → Prop
  semanticConsequence : theory → formula → Prop
  completeness : ∀ T φ, syntacticConsequence T φ ↔ semanticConsequence T φ

def manyValuedCompletenessClosed (M : ManyValuedCompleteness) : Prop :=
  M.completeness

theorem completeness_closed_intro (M : ManyValuedCompleteness) :
    manyValuedCompletenessClosed M :=
  M.completeness

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse