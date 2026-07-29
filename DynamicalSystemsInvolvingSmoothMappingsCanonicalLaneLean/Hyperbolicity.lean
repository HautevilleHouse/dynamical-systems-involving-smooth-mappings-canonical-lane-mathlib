import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure Hyperbolicity {S : SmoothDynamicalSystem} where
  linearization : S.phaseSpace → Type w
  stableSubbundle : Prop
  unstableSubbundle : Prop
  exponentialGrowth : Prop

structure HyperbolicityEvidence {S : SmoothDynamicalSystem}
    (H : Hyperbolicity S) where
  stableSubbundleClosed : H.stableSubbundle
  unstableSubbundleClosed : H.unstableSubbundle
  exponentialGrowthClosed : H.exponentialGrowth

def HyperbolicityClosed {S : SmoothDynamicalSystem}
    (H : Hyperbolicity S) : Prop :=
  H.stableSubbundle ∧ H.unstableSubbundle ∧ H.exponentialGrowth

theorem hyperbolicity_closed_from_evidence
    {S : SmoothDynamicalSystem} (H : Hyperbolicity S)
    (E : HyperbolicityEvidence H) : HyperbolicityClosed H := by
  exact And.intro E.stableSubbundleClosed
    (And.intro E.unstableSubbundleClosed E.exponentialGrowthClosed)

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse