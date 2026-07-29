import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.BridgeLemmas
import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

def ConstrainedGeneticsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_genetics_endgame (A : AdmissibleClass) : ConstrainedGeneticsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse
