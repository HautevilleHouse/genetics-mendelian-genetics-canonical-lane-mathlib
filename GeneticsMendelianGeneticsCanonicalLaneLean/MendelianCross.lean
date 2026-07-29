import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure MendelianCrossPackage where
  parentalGenotypes : GenotypePair
  offspringGenotypes : List GenotypePair
  expectedRatios : RatioExpectation
  observedRatios : RatioObservation
  chiSquaredStatistic : ℝ
  crossValid : Prop

structure GenotypePair where
  allele1 : String
  allele2 : String

def RatioExpectation

def RatioObservation

structure MendelianCrossEvidence (M : MendelianCrossPackage) where
  expectedRatiosMatchMendelian : M.expectedRatios.dominantRatio = 0.75 ∧ M.expectedRatios.recessiveRatio = 0.25
  chiSquaredBelowThreshold : M.chiSquaredStatistic < 3.841
  crossValidClosed : M.crossValid

def MendelianCrossClosed (M : MendelianCrossPackage) : Prop :=
  (M.expectedRatios.dominantRatio = 0.75 ∧ M.expectedRatios.recessiveRatio = 0.25) ∧
  M.chiSquaredStatistic < 3.841 ∧
  M.crossValid

theorem mendelian_cross_closed_from_evidence (M : MendelianCrossPackage) (E : MendelianCrossEvidence M) : MendelianCrossClosed M := by
  exact And.intro E.expectedRatiosMatchMendelian (And.intro E.chiSquaredBelowThreshold E.crossValidClosed)

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse
