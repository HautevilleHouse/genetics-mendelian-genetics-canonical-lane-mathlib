import canonicalLaneMathlib.AdmissibleClass

/-!
# Genotype Segregation Package

This module models Mendelian segregation of alleles during gamete formation.
-/

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure Allele (A : Type) where
  symbol : A
  derived from : Prop

structure Locus (A : Type) where
  alleles : List (Allele A)
  ploidy : Nat
  location : String

structure Genotype (A : Type) where
  maternal : Allele A
  paternal : Allele A
  locus : Locus A

structure SegregationLaw (A : Type) where
  equalChance : Prop
  independentAssortment : Prop
  randomFertilization : Prop

structure SegregationPackage (A : Type) where
  locus : Locus A
  parent1Genotype : Genotype A
  parent2Genotype : Genotype A
  offspringGenotypes : List (Genotype A)
  segregationLaw : SegregationLaw A
  probabilities : Prop

structure SegregationEvidence {A : Type} (S : SegregationPackage A) where
  equalChanceClosed : S.segregationLaw.equalChance
  independentAssortmentClosed : S.segregationLaw.independentAssortment
  randomFertilizationClosed : S.segregationLaw.randomFertilization
  probabilitiesComputed : S.probabilities

def SegregationClosed {A : Type} (S : SegregationPackage A) : Prop := 
  S.segregationLaw.equalChance ∧ S.segregationLaw.independentAssortment ∧
  S.segregationLaw.randomFertilization ∧ S.probabilities

theorem segregation_closed_from_evidence {A : Type} (S : SegregationPackage A) (E : SegregationEvidence S) : SegregationClosed S := by
  exact And.intro E.equalChanceClosed (And.intro E.independentAssortmentClosed (And.intro E.randomFertilizationClosed E.probabilitiesComputed))

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse