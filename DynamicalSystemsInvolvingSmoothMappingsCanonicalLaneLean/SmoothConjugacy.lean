import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure SmoothConjugacy {M1 : SmoothManifoldConfig} {T1 : FlowDomain M1} (F1 : SmoothFlow M1 T1) {M2 : SmoothManifoldConfig} {T2 : FlowDomain M2} (F2 : SmoothFlow M2 T2) where
  diffeomorphism : M1.carrier → M2.carrier
  diffeoSmooth : Smooth diffemorphism
  diffeoInvertible : ∃ g : M2.carrier → M1.carrier, (∀ x : M1.carrier, g (diffeomorphism x) = x) ∧ (∀ y : M2.carrier, diffemorphism (g y) = y) ∧ Smooth g
  conjugacyIdentity : ∀ x : M1.carrier, ∀ t : T1.timeInterval, diffemorphism (F1.flowMap t x) = F2.flowMap t (diffeomorphism x)

structure SmoothConjugacyEvidence {M1 : SmoothManifoldConfig} {T1 : FlowDomain M1} {F1 : SmoothFlow M1 T1} {M2 : SmoothManifoldConfig} {T2 : FlowDomain M2} {F2 : SmoothFlow M2 T2} (C : SmoothConjugacy F1 F2) where
  diffeoSmoothClosed : C.diffeoSmooth
  diffeoInvertibleClosed : ∃ g : M1.carrier → M2.carrier, (∀ x : M1.carrier, g (C.diffeomorphism x) = x) ∧ (∀ y : M2.carrier, C.diffeomorphism (g y) = y) ∧ Smooth g
  conjugacyIdentityClosed : ∀ x : M1.carrier, ∀ t : T1.timeInterval, C.diffeomorphism (F1.flowMap t x) = F2.flowMap t (C.diffeomorphism x)

def SmoothConjugacyClosed {M1 : SmoothManifoldConfig} {T1 : FlowDomain M1} {F1 : SmoothFlow M1 T1} {M2 : SmoothManifoldConfig} {T2 : FlowDomain M2} {F2 : SmoothFlow M2 T2} (C : SmoothConjugacy F1 F2) : Prop :=
  C.diffeoSmooth ∧
  (∃ g : M1.carrier → M2.carrier, (∀ x : M1.carrier, g (C.diffeomorphism x) = x) ∧ (∀ y : M2.carrier, C.diffeomorphism (g y) = y) ∧ Smooth g) ∧
  (∀ x : M1.carrier, ∀ t : T1.timeInterval, C.diffeomorphism (F1.flowMap t x) = F2.flowMap t (C.diffeomorphism x))

theorem smooth_conjugacy_closed_from_evidence {M1 : SmoothManifoldConfig} {T1 : FlowDomain M1} {F1 : SmoothFlow M1 T1} {M2 : SmoothManifoldConfig} {T2 : FlowDomain M2} {F2 : SmoothFlow M2 T2} (C : SmoothConjugacy F1 F2) (E : SmoothConjugacyEvidence C) : SmoothConjugacyClosed C :=
  And.intro E.diffeoSmoothClosed (And.intro E.diffeoinvertibleClosed E.conjugacyIdentityClosed)

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse