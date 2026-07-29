import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure SmoothFlow {M : SmoothManifoldConfig} (T : FlowDomain M) where
  flowMap : T.timeInterval → M.carrier → M.carrier
  smoothness : ∀ t : T.timeInterval, Smooth (flowMap t)
  groupLaw : ∀ t1 t2 : T.timeInterval, ∀ x : M.carrier, flowMap (T.ordering t1 t2) x = flowMap t1 (flowMap t2 x)
  identityLaw : ∀ x : M.carrier, flowMap T.startTime x = x

structure SmoothFlowEvidence {M : SmoothManifoldConfig} {T : FlowDomain M} (F : SmoothFlow M T) where
  smoothnessClosed : ∀ t : T.timeInterval, Smooth (F.flowMap t)
  groupLawClosed : ∀ t1 t2 : T.timeInterval, ∀ x : M.carrier, F.flowMap (T.ordering t1 t2) x = F.flowMap t1 (F.flowMap t2 x)
  identityLawClosed : ∀ x : M.carrier, F.flowMap T.startTime x = x

def SmoothFlowClosed {M : SmoothManifoldConfig} {T : FlowDomain M} (F : SmoothFlow M T) : Prop :=
  (∀ t : T.timeInterval, Smooth (F.flowMap t)) ∧
  (∀ t1 t2 : T.timeInterval, ∀ x : M.carrier, F.flowMap (T.ordering t1 t2) x = F.flowMap t1 (F.flowMap t2 x)) ∧
  (∀ x : M.carrier, F.flowMap T.startTime x = x)

theorem smooth_flow_closed_from_evidence {M : SmoothManifoldConfig} {T : FlowDomain M} (F : SmoothFlow M T) (E : SmoothFlowEvidence F) : SmoothFlowClosed F :=
  And.intro E.smoothnessClosed (And.intro E.groupLawClosed E.identityLawClosed)

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse