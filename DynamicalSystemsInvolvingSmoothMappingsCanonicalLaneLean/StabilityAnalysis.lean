import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean.HyperbolicDynamics

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure StabilityAnalysisPackage (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) (I : InvariantManifoldPackage M V F) (H : HyperbolicDynamicsPackage M V F I) where
  lyapunovFunction : Type u
  stabilityCondition : Prop
  asymptoticStability : Prop
  domainOfAttraction : Set M.carrier

structure StabilityAnalysisEvidence (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) (I : InvariantManifoldPackage M V F) (H : HyperbolicDynamicsPackage M V F I) (S : StabilityAnalysisPackage M V F I H) where
  stabilityConditionClosed : S.stabilityCondition
  asymptoticStabilityClosed : S.asymptoticStability

def StabilityAnalysisClosed (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) (I : InvariantManifoldPackage M V F) (H : HyperbolicDynamicsPackage M V F I) (S : StabilityAnalysisPackage M V F I H) : Prop :=
  S.stabilityCondition ∧ S.asymptoticStability

theorem stability_analysis_closed_from_evidence (M : DynamicalSystemManifold) (V : SmoothVectorField M) (F : FlowExistencePackage M V) (I : InvariantManifoldPackage M V F) (H : HyperbolicDynamicsPackage M V F I) (S : StabilityAnalysisPackage M V F I H) (E : StabilityAnalysisEvidence M V F I H S) : StabilityAnalysisClosed M V F I H S := by
  exact And.intro E.stabilityConditionClosed E.asymptoticStabilityClosed

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse
