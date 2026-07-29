import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure MorseSmalePackage (M : SmoothMappingPackage) where
  nonwanderingSet: Type u
  hyperbolicStructure: Prop
  strongTransversality: Prop
  stableUnstableManifoldsIntersectTransversely: Prop

structure MorseSmaleEvidence {M : SmoothMappingPackage}
    (MS : MorseSmalePackage M) where
  nonwanderingSetClosed : MS.nonwanderingSet
  hyperbolicStructureClosed : MS.hyperbolicStructure
  strongTransversalityClosed : MS.strongTransversality
  stableUnstableManifoldsIntersectTransverselyClosed : MS.stableUnstableManifoldsIntersectTransversely

def MorseSmaleClosed {M : SmoothMappingPackage}
    (MS : MorseSmalePackage M) : Prop :=
  MS.nonwanderingSet ∧ MS.hyperbolicStructure ∧ MS.strongTransversality ∧ MS.stableUnstableManifoldsIntersectTransversely

theorem morse_smale_closed_from_evidence
    {M : SmoothMappingPackage} (MS : MorseSmalePackage M)
    (E : MorseSmaleEvidence MS) : MorseSmaleClosed MS := by
  exact And.intro E.nonwanderingSetClosed
    (And.intro E.hyperbolicStructureClosed
      (And.intro E.strongTransversalityClosed E.stableUnstableManifoldsIntersectTransverselyClosed))

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse