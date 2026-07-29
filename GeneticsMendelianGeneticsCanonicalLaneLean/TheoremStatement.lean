import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure MendelianLocus where
  locus : String
  alleleA : String
  alleleB : String
  carrier : Type

definition MendelianWitnessClosed (l : MendelianLocus) : Prop :=
  l.alleleA ≠ l.alleleB

structure MendelianAdmittedObject where
  locus : MendelianLocus
  frequencyA : Nat
  frequencyB : Nat
  observerPopulation : Nat
  conclusion : MendelianWitnessClosed locus
  conclusionProp : conclusion

def sourceDescription : String :=
  "Mendelian genetics: Hardy-Weinberg equilibrium principle"

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse
