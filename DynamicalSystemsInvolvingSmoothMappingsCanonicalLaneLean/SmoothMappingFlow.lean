import DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure SmoothMappingFlowPackage (M : Type*) [TopologicalSpace M] [ChartedSpace ℝ M] where
  flowMap : ℝ → M → M
  smoothInTimeAndSpace : Prop
  groupProperty : Prop
  fixedPointSet : Set M
  hyperbolicityData : Prop

structure SmoothMappingFlowEvidence {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    (F : SmoothMappingFlowPackage M) where
  smoothInTimeAndSpaceClosed : F.smoothInTimeAndSpace
  groupPropertyClosed : F.groupProperty
  hyperbolicityDataClosed : F.hyperbolicityData

def SmoothMappingFlowClosed {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    (F : SmoothMappingFlowPackage M) : Prop :=
  F.smoothInTimeAndSpace ∧ F.groupProperty ∧ F.hyperbolicityData

theorem smooth_mapping_flow_closed_from_evidence
    {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    (F : SmoothMappingFlowPackage M) (E : SmoothMappingFlowEvidence F) :
    SmoothMappingFlowClosed F := by
  exact And.intro E.smoothInTimeAndSpaceClosed
    (And.intro E.groupPropertyClosed E.hyperbolicityDataClosed)

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse