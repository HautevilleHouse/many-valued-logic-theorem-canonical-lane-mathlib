import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManyValuedLogicTheoremCanonicalLaneLean

structure ManyValuedAdmittedObject where
  truthSpace : Type u
  designatedValues : Set truthSpace
  connectives : List (String × (List truthSpace → truthSpace))
  theoremStatement : Prop

structure AdmissibleClass where
  object : ManyValuedAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ManyValuedWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def ManyValuedWitnessClosed (O : ManyValuedAdmittedObject) : Prop :=
  O.theoremStatement

end ManyValuedLogicTheoremCanonicalLaneLean
end HautevilleHouse