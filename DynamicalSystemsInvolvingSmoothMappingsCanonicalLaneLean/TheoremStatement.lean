import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure DynamicalAdmittedObject where
  stateSpace : Type
  smoothMapping : Type
  dynamicalProperty : Prop
  conclusion : dynamicalProperty

def DynamicalWitnessClosed (O : DynamicalAdmittedObject) : Prop :=
  O.dynamicalProperty

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse