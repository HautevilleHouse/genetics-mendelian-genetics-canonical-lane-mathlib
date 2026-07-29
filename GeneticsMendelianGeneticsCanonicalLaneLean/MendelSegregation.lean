import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure MendelSegregationPackage where
  parentGenotype : String × String
  offspringGenotypes : List String
  expectedRatio : List Nat
  observedCounts : List Nat
  chiSquareStat : Rat
  segregationValid : Prop

structure MendelSegregationEvidence (M : MendelSegregationPackage) where
  expectedRatioCalc : M.expectedRatio
  observedCountsCalc : M.observedCounts
  chiSquareStatCalc : M.chiSquareStat
  segregationValidClosed : M.segregationValid

def MendelSegregationClosed (M : MendelSegregationPackage) : Prop :=
  M.expectedRatio ∧ M.observedCounts ∧ M.chiSquareStat ∧ M.segregationValid

theorem mendel_segregation_closed_from_evidence (M : MendelSegregationPackage) 
    (E : MendelSegregationEvidence M) : MendelSegregationClosed M := by
  exact And.intro E.expectedRatioCalc
    (And.intro E.observedCountsCalc
      (And.intro E.chiSquareStatCalc E.segregationValidClosed))

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse