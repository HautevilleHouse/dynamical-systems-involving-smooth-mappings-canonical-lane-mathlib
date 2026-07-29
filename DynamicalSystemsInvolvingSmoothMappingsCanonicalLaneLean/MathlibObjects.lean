import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure SmoothDynamicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SmoothDynamicalAdmittedObject where
  space : SmoothDynamicalSpace
  smoothManifoldWithoutBoundary : Prop
  dynamicalSystemGiven : Prop
  invariantSetExists : Prop
  conclusion : invariantSetExists

def SmoothDynamicalWitnessClosed (O : SmoothDynamicalAdmittedObject) : Prop :=
  O.invariantSetExists

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse