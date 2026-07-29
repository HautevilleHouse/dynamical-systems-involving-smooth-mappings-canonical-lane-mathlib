import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure SmoothDynamicalSystem where
  phaseSpace : Type u
  timeDomain : Type v
  evolutionMap : timeDomain → phaseSpace → phaseSpace
  smoothDependence : Prop
  groupAction : Prop

structure SmoothDynamicalSystemEvidence (S : SmoothDynamicalSystem) where
  smoothDependenceClosed : S.smoothDependence
  groupActionClosed : S.groupAction

def SmoothDynamicalSystemClosed (S : SmoothDynamicalSystem) : Prop :=
  S.smoothDependence ∧ S.groupAction

theorem smooth_dynamical_system_closed_from_evidence
    (S : SmoothDynamicalSystem) (E : SmoothDynamicalSystemEvidence S) :
    SmoothDynamicalSystemClosed S := by
  exact And.intro E.smoothDependenceClosed E.groupActionClosed

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse