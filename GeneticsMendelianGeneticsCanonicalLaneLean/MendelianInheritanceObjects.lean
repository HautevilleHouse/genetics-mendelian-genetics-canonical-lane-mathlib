import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure Organism where
  carrier : Type
  genome : Type

structure GeneticLocus where
  chr : Nat
  position : Nat
  alleles : List Type

structure AdmissibleGenotype where
  loci : List GeneticLocus
  traitExpression : Prop
  phenotype : Type
  conclusion : traitExpression

def GenotypeWitnessClosed (G : AdmissibleGenotype) : Prop :=
  G.traitExpression

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse
