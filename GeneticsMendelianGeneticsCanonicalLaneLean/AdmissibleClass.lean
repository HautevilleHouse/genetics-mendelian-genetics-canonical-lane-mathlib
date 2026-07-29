import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure AdmissibleClass where
  object : MendelianAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MendelianWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse