import canonicalLaneMathlib.AdmissibleClass

/-!
# Punnett Square Package

This module formalizes the Punnett square as a combinatorial structure for predicting offspring genotypes.
-/

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure Gamete (A : Type) where
  allele : Allele A
  probability : Float

structure PunnettSquare (A : Type) where
  maternalGametes : List (Gamete A)
  paternalGametes : List (Gamete A)
  offspringGrid : List (List (Genotype A))

def combineAlleles {A : Type} (maternalAllele : Allele A) (paternalAllele : Allele A) (locus : Locus A) : Genotype A :=
  { maternal := maternalAllele, paternal := paternalAllele, locus := locus }

def fillGrid {A : Type} (p : PunnettSquare A) (locus : Locus A) : PunnettSquare A :=
  let grid := List.map (fun mg => List.map (fun pg => combineAlleles mg.allele pg.allele locus) p.paternalGametes) p.maternalGametes
  { p with offspringGrid := grid }

structure PunnettSquarePackage (A : Type) where
  punnettSquare : PunnettSquare A
  locus : Locus A
  gametesFormed : Prop
  fertilizationRandom : Prop
  gridComplete : Prop

structure PunnettSquareEvidence {A : Type} (P : PunnettSquarePackage A) where
  gametesFormedClosed : P.gametesFormed
  fertilizationRandomClosed : P.fertilizationRandom
  gridCompleteClosed : P.gridComplete

def PunnettSquareClosed {A : Type} (P : PunnettSquarePackage A) : Prop :=
  P.gametesFormed ∧ P.fertilizationRandom ∧ P.gridComplete

theorem punnett_square_closed_from_evidence {A : Type} (P : PunnettSquarePackage A) (E : PunnettSquareEvidence P) : PunnettSquareClosed P := by
  exact And.intro E.gametesFormedClosed (And.intro E.fertilizationRandomClosed E.gridCompleteClosed)

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse