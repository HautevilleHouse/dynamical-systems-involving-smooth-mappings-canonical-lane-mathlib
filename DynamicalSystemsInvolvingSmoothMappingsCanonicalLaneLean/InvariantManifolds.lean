import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure InvariantManifoldPackage (M : SmoothMappingPackage) where
  invariantSet: Type u
  stabilityType: Prop
  existenceSaddle: Prop
  centerManifoldReduction: Prop

structure InvariantManifoldEvidence {M : SmoothMappingPackage}
    (I : InvariantManifoldPackage M) where
  invariantSetExistsClosed : I.invariantSet
  stabilityTypeClosed : I.stabilityType
  existenceSaddleClosed : I.existenceSaddle
  centerManifoldReductionClosed : I.centerManifoldReduction

def InvariantManifoldClosed {M : SmoothMappingPackage}
    (I : InvariantManifoldPackage M) : Prop :=
  I.invariantSet ∧ I.stabilityType ∧ I.existenceSaddle ∧ I.centerManifoldReduction

theorem invariant_manifold_closed_from_evidence
    {M : SmoothMappingPackage} (I : InvariantManifoldPackage M)
    (E : InvariantManifoldEvidence I) : InvariantManifoldClosed I := by
  exact And.intro E.invariantSetExistsClosed
    (And.intro E.stabilityTypeClosed
      (And.intro E.existenceSaddleClosed E.centerManifoldReductionClosed))

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse