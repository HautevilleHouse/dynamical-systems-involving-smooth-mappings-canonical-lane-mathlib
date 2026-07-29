import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure InvariantManifold {S : SmoothDynamicalSystem} where
  submanifold : S.phaseSpace → Prop
  invariantUnderFlow : Prop
  smoothEmbedding : Prop

structure InvariantManifoldEvidence {S : SmoothDynamicalSystem}
    (I : InvariantManifold S) where
  invariantUnderFlowClosed : I.invariantUnderFlow
  smoothEmbeddingClosed : I.smoothEmbedding

def InvariantManifoldClosed {S : SmoothDynamicalSystem}
    (I : InvariantManifold S) : Prop :=
  I.invariantUnderFlow ∧ I.smoothEmbedding

theorem invariant_manifold_closed_from_evidence
    {S : SmoothDynamicalSystem} (I : InvariantManifold S)
    (E : InvariantManifoldEvidence I) : InvariantManifoldClosed I := by
  exact And.intro E.invariantUnderFlowClosed E.smoothEmbeddingClosed

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse