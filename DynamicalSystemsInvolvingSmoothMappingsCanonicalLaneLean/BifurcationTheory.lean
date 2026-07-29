import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure Bifurcation {S : SmoothDynamicalSystem} where
  parameterSpace : Type x
  family : parameterSpace → S.evolutionMap
  criticalPoint : S.phaseSpace
  bifurcationCondition : Prop

structure BifurcationEvidence {S : SmoothDynamicalSystem}
    (B : Bifurcation S) where
  bifurcationConditionClosed : B.bifurcationCondition

def BifurcationClosed {S : SmoothDynamicalSystem}
    (B : Bifurcation S) : Prop :=
  B.bifurcationCondition

theorem bifurcation_closed_from_evidence
    {S : SmoothDynamicalSystem} (B : Bifurcation S)
    (E : BifurcationEvidence B) : BifurcationClosed B := by
  exact E.bifurcationConditionClosed

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse