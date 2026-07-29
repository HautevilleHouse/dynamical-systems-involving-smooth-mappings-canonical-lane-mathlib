import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean.SmoothVectorField

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure FlowExistencePackage (M : DynamicalSystemManifold) (V : SmoothVectorField M) where
  timeDomain : Type u
  timeTopology : TopologicalSpace timeDomain
  flow : timeDomain → M.carrier → M.carrier
  flowSmooth : Prop
  flowGroupProperty : Prop
  maximalInterval : Prop

structure FlowExistenceEvidence (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) where
  flowSmoothClosed : F.flowSmooth
  flowGroupPropertyClosed : F.flowGroupProperty
  maximalIntervalClosed : F.maximalInterval

def FlowExistenceClosed (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) : Prop :=
  F.flowSmooth ∧ F.flowGroupProperty ∧ F.maximalInterval

theorem flow_existence_closed_from_evidence (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) (E : FlowExistenceEvidence M V F) : FlowExistenceClosed M V F := by
  exact And.intro E.flowSmoothClosed (And.intro E.flowGroupPropertyClosed E.maximalIntervalClosed)

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse
