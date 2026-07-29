import GeneticsMendelianGeneticsCanonicalLaneLean.MendelianInheritanceObjects

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure QuantitativeGeneticsPackage (G : AdmissibleGenotype) where
  polygenicTraits : List Type
  heritability : ℚ
  additiveVariance : ℚ
  dominanceVariance : ℚ
  environmentalVariance : ℚ
  totalPhenotypicVariance : ℚ
  heritabilityEquation : totalPhenotypicVariance = additiveVariance + dominanceVariance + environmentalVariance

structure QuantitativeGeneticsEvidence {G : AdmissibleGenotype} (Q : QuantitativeGeneticsPackage G) where
  heritabilityClosed : Q.heritability = Q.additiveVariance / (Q.additiveVariance + Q.dominanceVariance + Q.environmentalVariance)
  heritabilityEquationClosed : Q.heritabilityEquation

def QuantitativeGeneticsClosed {G : AdmissibleGenotype} (Q : QuantitativeGeneticsPackage G) : Prop :=
  Q.heritability = Q.additiveVariance / (Q.additiveVariance + Q.dominanceVariance + Q.environmentalVariance) ∧ Q.heritabilityEquation

theorem quantitative_genetics_closed_from_evidence {G : AdmissibleGenotype} (Q : QuantitativeGeneticsPackage G) (E : QuantitativeGeneticsEvidence Q) : QuantitativeGeneticsClosed Q := by
  exact And.intro E.heritabilityClosed E.heritabilityEquationClosed

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse
