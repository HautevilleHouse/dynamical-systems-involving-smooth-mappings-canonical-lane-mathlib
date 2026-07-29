import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean.DynamicalSystemManifold

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure SmoothVectorField (M : DynamicalSystemManifold) where
  vectorField : M.carrier → M.carrier
  smooth : Prop
  complete : Prop

structure SmoothVectorFieldEvidence (M : DynamicalSystemManifold) (V : SmoothVectorField M) where
  smoothClosed : V.smooth
  completeClosed : V.complete

def SmoothVectorFieldClosed (M : DynamicalSystemManifold) (V : SmoothVectorField M) : Prop :=
  V.smooth ∧ V.complete

theorem smooth_vector_field_closed_from_evidence (M : DynamicalSystemManifold) (V : SmoothVectorField M) (E : SmoothVectorFieldEvidence M V) : SmoothVectorFieldClosed M V := by
  exact And.intro E.smoothClosed E.completeClosed

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse
