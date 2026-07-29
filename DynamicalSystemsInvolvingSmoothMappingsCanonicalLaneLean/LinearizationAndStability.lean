import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure LinearizationPackage {M : SmoothManifoldConfig} {T : FlowDomain M} (F : SmoothFlow M T) where
  equilibriumPoint : M.carrier
  isEquilibrium : F.flowMap T.startTime equilibriumPoint = equilibriumPoint ∧ ∀ t : T.timeInterval, F.flowMap t equilibriumPoint = equilibriumPoint
  derivativeAlongFlow : T.timeInterval → (TangentBundleConfig M).totalSpace → (TangentBundleConfig M).totalSpace
  derivativeAtEquilibrium : (TangentBundleConfig M).totalSpace → (TangentBundleConfig M).totalSpace
  spectralGapPositivity : Prop
  hyperbolicity : Prop

structure LinearizationEvidence {M : SmoothManifoldConfig} {T : FlowDomain M} {F : SmoothFlow M T} (L : LinearizationPackage F) where
  equilibriumClosed : F.flowMap T.startTime L.equilibriumPoint = L.equilibriumPoint ∧ ∀ t : T.timeInterval, F.flowMap t L.equilibriumPoint = L.equilibriumPoint
  spectralGapPositivityClosed : L.spectralGapPositivity
  hyperbolicityClosed : L.hyperbolicity

def LinearizationClosed {M : SmoothManifoldConfig} {T : FlowDomain M} {F : SmoothFlow M T} (L : LinearizationPackage F) : Prop :=
  (F.flowMap T.startTime L.equilibriumPoint = L.equilibriumPoint ∧ ∀ t : T.timeInterval, F.flowMap t L.equilibriumPoint = L.equilibriumPoint) ∧
  L.spectralGapPositivity ∧ L.hyperbolicity

theorem linearization_closed_from_evidence {M : SmoothManifoldConfig} {T : FlowDomain M} {F : SmoothFlow M T} (L : LinearizationPackage F) (E : LinearizationEvidence L) : LinearizationClosed L :=
  And.intro E.equilibriumClosed (And.intro E.spectralGapPositivityClosed E.hyperbolicityClosed)

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse