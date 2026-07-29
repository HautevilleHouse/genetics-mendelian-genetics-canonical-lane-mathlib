import canonicalLaneMathlib.AdmissibleClass

/-!
# Hardy-Weinberg Equilibrium Package

This module formalizes the Hardy-Weinberg principle for a population at equilibrium.
-/

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure Population (A : Type) where
  individuals : List (Genotype A)
  size : Nat

structure AlleleFrequency (A : Type) where
  allele : Allele A
  frequency : Float

structure HardyWeinbergState (A : Type) where
  population : Population A
  alleleFrequencies : List (AlleleFrequency A)
  expectedGenotypeFrequencies : Prop
  observedGenotypeFrequencies : Prop

def equilibriumCondition {A : Type} (p : Float) (q : Float) : Prop :=
  p + q = 1.0

structure HardyWeinbergPackage (A : Type) where
  state : HardyWeinbergState A
  noEvolution : Prop
  randomMating : Prop
  largePopulation : Prop
  noMutation : Prop
  noMigration : Prop
  noSelection : Prop
  expectedFrequenciesMatchHardyWeinberg : Prop

structure HardyWeinbergEvidence {A : Type} (H : HardyWeinbergPackage A) where
  noEvolutionClosed : H.noEvolution
  randomMatingClosed : H.randomMating
  largePopulationClosed : H.largePopulation
  noMutationClosed : H.noMutation
  noMigrationClosed : H.noMigration
  noSelectionClosed : H.noSelection
  expectedFrequenciesMatchHardyWeinbergClosed : H.expectedFrequenciesMatchHardyWeinberg

def HardyWeinbergClosed {A : Type} (H : HardyWeinbergPackage A) : Prop :=
  H.noEvolution ∧ H.randomMating ∧ H.largePopulation ∧ H.noMutation ∧ H.noMigration ∧ H.noSelection ∧ H.expectedFrequenciesMatchHardyWeinberg

theorem hardy_weinberg_closed_from_evidence {A : Type} (H : HardyWeinbergPackage A) (E : HardyWeinbergEvidence H) : HardyWeinbergClosed H := by
  exact And.intro E.noEvolutionClosed (And.intro E.randomMatingClosed (And.intro E.largePopulationClosed (And.intro E.noMutationClosed (And.intro E.noMigrationClosed (And.intro E.noSelectionClosed E.expectedFrequenciesMatchHardyWeinbergClosed)))))

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse