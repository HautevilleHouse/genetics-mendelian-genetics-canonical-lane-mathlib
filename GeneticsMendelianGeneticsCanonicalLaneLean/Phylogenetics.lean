import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure PhylogeneticsPackage where
  speciesList : List Species
  evolutionaryTree : TreeStructure
  treeLikelihood : ℝ
  treeValid : Prop

structure Species where
  name : String
  geneticDistance : ℝ

structure TreeStructure where
  root : Nat
  edges : List (Nat × Nat × ℝ)

structure PhylogeneticsEvidence (P : PhylogeneticsPackage) where
  speciesNonempty : P.speciesList ≠ []
  treeLikelihoodPositive : P.treeLikelihood > 0
  treeStructureConsistent : P.evolutionaryTree.root ∈ Finset.range (P.speciesList.length)
  treeValidClosed : P.treeValid

def PhylogeneticsClosed (P : PhylogeneticsPackage) : Prop :=
  P.speciesList ≠ [] ∧
  P.treeLikelihood > 0 ∧
  P.evolutionaryTree.root ∈ Finset.range (P.speciesList.length) ∧
  P.treeValid

theorem phylogenetics_closed_from_evidence (P : PhylogeneticsPackage) (E : PhylogeneticsEvidence P) : PhylogeneticsClosed P := by
  exact And.intro E.speciesNonempty (And.intro E.treeLikelihoodPositive (And.intro E.treeStructureConsistent E.treeValidClosed))

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse
