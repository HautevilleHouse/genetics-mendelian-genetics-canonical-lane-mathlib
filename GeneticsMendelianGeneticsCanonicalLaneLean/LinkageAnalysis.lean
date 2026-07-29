import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure LinkageAnalysisPackage where
  markerSet : List Marker
  recombinationFraction : ℝ
  lodScore : ℝ
  linkageClaimed : Prop

structure Marker where
  chromosome : Nat
  position : Nat

def Marker

def lodThreshold : ℝ := 3.0

structure LinkageEvidence (L : LinkageAnalysisPackage) where
  recombinationFractionInRange : 0 ≤ L.recombinationFraction ∧ L.recombinationFraction ≤ 0.5
  lodScoreAboveThreshold : L.lodScore ≥ lodThreshold
  linkageClaimedClosed : L.linkageClaimed

def LinkageClosed (L : LinkageAnalysisPackage) : Prop :=
  (0 ≤ L.recombinationFraction ∧ L.recombinationFraction ≤ 0.5) ∧
  L.lodScore ≥ lodThreshold ∧
  L.linkageClaimed

theorem linkage_closed_from_evidence (L : LinkageAnalysisPackage) (E : LinkageEvidence L) : LinkageClosed L := by
  exact And.intro E.recombinationFractionInRange (And.intro E.lodScoreAboveThreshold E.linkageClaimedClosed)

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse
