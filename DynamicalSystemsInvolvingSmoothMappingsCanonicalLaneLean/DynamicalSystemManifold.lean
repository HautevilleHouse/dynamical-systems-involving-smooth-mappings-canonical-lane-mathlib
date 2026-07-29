import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure DynamicalSystemManifold where
  carrier : Type u
  topology : TopologicalSpace carrier
  smoothAtlas : Type v
  smoothStructure : Prop
  compact : Prop
  boundaryless : Prop
  dimension : Nat

def DynamicalSystemManifoldClosed (M : DynamicalSystemManifold) : Prop :=
  M.smoothStructure ∧ M.compact ∧ M.boundaryless ∧ M.dimension = 3

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse
