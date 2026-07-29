import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure PhylogeneticTreePackage where
  speciesList : List String
  geneticDistances : Type
  treeTopology : Type
  branchLengths : Type
  likelihoodScore : Rat
  optimalTree : Prop

structure PhylogeneticTreeEvidence (P : PhylogeneticTreePackage) where
  geneticDistancesCalc : P.geneticDistances
  treeTopologyCalc : P.treeTopology
  branchLengthsCalc : P.branchLengths
  optimalTreeClosed : P.optimalTree

def PhylogeneticTreeClosed (P : PhylogeneticTreePackage) : Prop :=
  P.geneticDistances ∧ P.treeTopology ∧ P.branchLengths ∧ P.optimalTree

theorem phylogenetic_tree_closed_from_evidence (P : PhylogeneticTreePackage) 
    (E : PhylogeneticTreeEvidence P) : PhylogeneticTreeClosed P := by
  exact And.intro E.geneticDistancesCalc
    (And.intro E.treeTopologyCalc
      (And.intro E.branchLengthsCalc E.optimalTreeClosed))

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse