import GeneticsMendelianGeneticsCanonicalLaneLean.MendelianInheritanceObjects

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure PopulationGeneticsPackage (G : AdmissibleGenotype) where
  populationSize : Nat
  alleleFrequencies : List ℚ
  mutationRate : ℚ
  selectionCoefficient : ℚ
  migrationRate : ℚ
  populationSizeLarge : populationSize > 999
  geneticDriftTreated : Prop

structure PopulationGeneticsEvidence {G : AdmissibleGenotype} (P : PopulationGeneticsPackage G) where
  populationSizeLargeClosed : P.populationSizeLarge
  geneticDriftTreatedClosed : P.geneticDriftTreated
  freqSumOne : sum P.alleleFrequencies = 1

def PopulationGeneticsClosed {G : AdmissibleGenotype} (P : PopulationGeneticsPackage G) : Prop :=
  P.populationSizeLarge ∧ P.geneticDriftTreated ∧ sum P.alleleFrequencies = 1

theorem population_genetics_closed_from_evidence {G : AdmissibleGenotype} (P : PopulationGeneticsPackage G) (E : PopulationGeneticsEvidence P) : PopulationGeneticsClosed P := by
  exact And.intro E.populationSizeLargeClosed (And.intro E.geneticDriftTreatedClosed E.freqSumOne)

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse
