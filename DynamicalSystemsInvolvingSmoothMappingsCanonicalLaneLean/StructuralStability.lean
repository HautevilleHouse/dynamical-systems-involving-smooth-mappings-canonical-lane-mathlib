import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure StructuralStability {S : SmoothDynamicalSystem} where
  perturbationClass : Type y
  smallPerturbation : perturbationClass → S.evolutionMap
  topologicalConjugacy : Prop
  stabilityCondition : Prop

structure StructuralStabilityEvidence {S : SmoothDynamicalSystem}
    (St : StructuralStability S) where
  topologicalConjugacyClosed : St.topologicalConjugacy
  stabilityConditionClosed : St.stabilityCondition

def StructuralStabilityClosed {S : SmoothDynamicalSystem}
    (St : StructuralStability S) : Prop :=
  St.topologicalConjugacy ∧ St.stabilityCondition

theorem structural_stability_closed_from_evidence
    {S : SmoothDynamicalSystem} (St : StructuralStability S)
    (E : StructuralStabilityEvidence St) : StructuralStabilityClosed St := by
  exact And.intro E.topologicalConjugacyClosed E.stabilityConditionClosed

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse