import GeneticsMendelianGeneticsCanonicalLaneLean.MendelianInheritanceObjects

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure LinkageAnalysisPackage (G : AdmissibleGenotype) where
  markerLoci : List GeneticLocus
  diseaseLocus : GeneticLocus
  recombinationFraction : ℚ
  numberOfMeioses : Nat
  largess : numberOfMeioses > 9999
  lodScore : ℚ
  significanceThreshold : ℚ
  lodPositive : lodScore > 0

structure LinkageAnalysisEvidence {G : AdmissibleGenotype} (L : LinkageAnalysisPackage G) where
  recombinationFractionClosed : L.recombinationFraction ≥ 0 ∧ L.recombinationFraction ≤ 1
  lodScoreClosed : L.lodScore > L.significanceThreshold
  largessClosed : L.largess
  lodPositiveClosed : L.lodPositive

def LinkageAnalysisClosed {G : AdmissibleGenotype} (L : LinkageAnalysisPackage G) : Prop :=
  (L.recombinationFraction ≥ 0 ∧ L.recombinationFraction ≤ 1) ∧ (L.lodScore > L.significanceThreshold) ∧ L.largess ∧ L.lodPositive

theorem linkage_analysis_closed_from_evidence {G : AdmissibleGenotype} (L : LinkageAnalysisPackage G) (E : LinkageAnalysisEvidence L) : LinkageAnalysisClosed L := by
  exact And.intro E.recombinationFractionClosed (And.intro E.lodScoreClosed (And.intro E.largessClosed E.lodPositiveClosed))

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse
