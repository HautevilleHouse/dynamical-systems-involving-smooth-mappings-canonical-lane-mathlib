import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure SmoothMappingPackage where
  sourceManifold : Type u
  targetManifold : Type v
  mappingSmooth : Prop
  rankCondition : Prop
  transversalityCondition : Prop

structure SmoothMappingEvidence (M : SmoothMappingPackage) where
  mappingSmoothClosed : M.mappingSmooth
  rankConditionClosed : M.rankCondition
  transversalityConditionClosed : M.transversalityCondition

def SmoothMappingClosed (M : SmoothMappingPackage) : Prop :=
  M.mappingSmooth ∧ M.rankCondition ∧ M.transversalityCondition

theorem smooth_mapping_closed_from_evidence
    (M : SmoothMappingPackage) (E : SmoothMappingEvidence M) :
    SmoothMappingClosed M := by
  exact And.intro E.mappingSmoothClosed
    (And.intro E.rankConditionClosed E.transversalityConditionClosed)

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse