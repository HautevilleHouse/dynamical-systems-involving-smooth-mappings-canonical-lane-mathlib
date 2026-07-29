import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean.InvariantManifold

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure HyperbolicDynamicsPackage (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) (I : InvariantManifoldPackage M V F) where
  hyperbolicStructure : Prop
  stableManifold : Type u
  unstableManifold : Type v
  stableSmooth : Prop
  unstableSmooth : Prop
  saddlePointProperty : Prop

structure HyperbolicDynamicsEvidence (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) (I : InvariantManifoldPackage M V F) (H : HyperbolicDynamicsPackage M V F I) where
  hyperbolicStructureClosed : H.hyperbolicStructure
  stableSmoothClosed : H.stableSmooth
  unstableSmoothClosed : H.unstableSmooth
  saddlePointPropertyClosed : H.saddlePointProperty

def HyperbolicDynamicsClosed (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) (I : InvariantManifoldPackage M V F) (H : HyperbolicDynamicsPackage M V F I) : Prop :=
  H.hyperbolicStructure ∧ H.stableSmooth ∧ H.unstableSmooth ∧ H.saddlePointProperty

theorem hyperbolic_dynamics_closed_from_evidence (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) (I : InvariantManifoldPackage M V F) (H : HyperbolicDynamicsPackage M V F I) (E : HyperbolicDynamicsEvidence M V F I H) : HyperbolicDynamicsClosed M V F I H := by
  exact And.intro E.hyperbolicStructureClosed (And.intro E.stableSmoothClosed (And.intro E.unstableSmoothClosed E.saddlePointPropertyClosed))

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse
