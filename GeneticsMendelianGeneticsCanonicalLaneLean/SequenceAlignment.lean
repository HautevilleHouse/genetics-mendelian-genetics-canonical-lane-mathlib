import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

structure SequenceAlignmentPackage where
  querySequence : String
  referenceSequence : String
  alignmentScore : ℕ
  identityPercent : ℝ
  alignmentValid : Prop

structure AlignmentEvidence (A : SequenceAlignmentPackage) where
  sequencesNotEmpty : A.querySequence ≠ "" ∧ A.referenceSequence ≠ ""
  alignmentScorePositive : A.alignmentScore > 0
  identityPercentInRange : 0 ≤ A.identityPercent ∧ A.identityPercent ≤ 100
  alignmentValidClosed : A.alignmentValid

def SequenceAlignmentClosed (A : SequenceAlignmentPackage) : Prop :=
  (A.querySequence ≠ "" ∧ A.referenceSequence ≠ "") ∧
  A.alignmentScore > 0 ∧
  (0 ≤ A.identityPercent ∧ A.identityPercent ≤ 100) ∧
  A.alignmentValid

theorem sequence_alignment_closed_from_evidence (A : SequenceAlignmentPackage) (E : AlignmentEvidence A) : SequenceAlignmentClosed A := by
  exact And.intro E.sequencesNotEmpty (And.intro E.alignmentScorePositive (And.intro E.identityPercentInRange E.alignmentValidClosed))

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse
