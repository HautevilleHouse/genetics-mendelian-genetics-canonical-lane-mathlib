import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsMendelianGeneticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MendelianWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GeneticsMendelianGeneticsCanonicalLaneLean
end HautevilleHouse