import DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean.HyperbolicDynamics

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure ChaoticBehaviorPackage {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    {F : SmoothMappingFlowPackage M} {I : InvariantManifoldsPackage F}
    (H : HyperbolicDynamicsPackage I) where
  densePeriodicPoints : Prop
  topologicalTransitivity : Prop
  sensitiveDependence : Prop
  entropyPositive : Prop

structure ChaoticBehaviorEvidence {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    {F : SmoothMappingFlowPackage M} {I : InvariantManifoldsPackage F}
    {H : HyperbolicDynamicsPackage I} (C : ChaoticBehaviorPackage H) where
  densePeriodicPointsClosed : C.densePeriodicPoints
  topologicalTransitivityClosed : C.topologicalTransitivity
  sensitiveDependenceClosed : C.sensitiveDependence
  entropyPositiveClosed : C.entropyPositive

def ChaoticBehaviorClosed {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    {F : SmoothMappingFlowPackage M} {I : InvariantManifoldsPackage F}
    {H : HyperbolicDynamicsPackage I} (C : ChaoticBehaviorPackage H) : Prop :=
  C.densePeriodicPoints ∧ C.topologicalTransitivity ∧ C.sensitiveDependence ∧ C.entropyPositive

theorem chaotic_behavior_closed_from_evidence
    {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    {F : SmoothMappingFlowPackage M} {I : InvariantManifoldsPackage F}
    {H : HyperbolicDynamicsPackage I} (C : ChaoticBehaviorPackage H)
    (E : ChaoticBehaviorEvidence C) : ChaoticBehaviorClosed C := by
  exact And.intro E.densePeriodicPointsClosed
    (And.intro E.topologicalTransitivityClosed
      (And.intro E.sensitiveDependenceClosed E.entropyPositiveClosed))

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse