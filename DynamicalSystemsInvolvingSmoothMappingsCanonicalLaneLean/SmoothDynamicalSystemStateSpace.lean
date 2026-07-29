import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure SmoothManifoldConfig where
  carrier : Type u
  atlas : Type v
  smoothAtlasCompatible : Prop
  hausdorff : Prop
  secondCountable : Prop
  dimension : Nat
  smoothTransitionFunctions : Prop

structure TangentBundleConfig (M : SmoothManifoldConfig) where
  totalSpace : Type w
  projectionMap : totalSpace → M.carrier
  smoothStructure : Prop
  linearFiberStructure : M.carrier → Type x
  smoothSections : Type y

structure FlowDomain (M : SmoothManifoldConfig) where
  timeInterval : Type z
  startTime : timeInterval
  ordering : timeInterval → timeInterval → Prop
  continuousStructure : Prop
  initialTimeExistence : Prop

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse