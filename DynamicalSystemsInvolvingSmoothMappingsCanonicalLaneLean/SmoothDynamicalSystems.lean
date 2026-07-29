import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure SmoothDynamicalSystem where
  manifold : Type u
  manifoldTopology : TopologicalSpace manifold
  smoothStructure : ContDiffModel 𝕊 manifold
  tangentBundle : Type v
  vectorField : manifold → tangentBundle
  flowMap : ℝ → manifold → manifold
  flowSmooth : ContDiff 𝕊 ⊤ (uncurry flowMap)
  flowGroupProperty : ∀ t s x, flowMap (t + s) x = flowMap t (flowMap s x)
  flowZero : ∀ x, flowMap 0 x = x

structure InvariantManifoldPackage (S : SmoothDynamicalSystem) where
  invariantSet : Set S.manifold
  forwardInvariant : ∀ x ∈ invariantSet, ∀ t ≥ 0, S.flowMap t x ∈ invariantSet
  backwardInvariant : ∀ x ∈ invariantSet, ∀ t ≤ 0, S.flowMap t x ∈ invariantSet
  smoothEmbedding : Submanifold 𝕊 S.manifold

structure HyperbolicSetPackage (S : SmoothDynamicalSystem) where
  compactInvariantSet : Set S.manifold
  tangentBundleDecomposition : Prop
  uniformHyperbolicity : Prop
  stableUnstableDistinction : Prop

structure SmaleHorseshoePackage (S : SmoothDynamicalSystem) where
  hyperbolicSet : HyperbolicSetPackage S
  transverseHomoclinicPoint : Prop
  chaoticDynamics : Prop
  symbolicDynamicsCoding : Prop

structure AnosovFlowPackage (S : SmoothDynamicalSystem) where
  hyperbolicSetFullManifold : HyperbolicSetPackage S
  transitive : Prop
  mixing : Prop
  structuralStability : Prop

structure MorseSmalePackage (S : SmoothDynamicalSystem) where
  fixedPointsFinite : Prop
  periodicOrbitsFinite : Prop
  transverseIntersections : Prop
  gradientLikeDynamics : Prop
  omegaLimitSetClassification : Prop

structure AttractorStructurePackage (S : SmoothDynamicalSystem) where
  attractingSet : Set S.manifold
  basinOfAttraction : Set S.manifold
  topologicalTransitivity : Prop
  sensitiveDependence : Prop
  characterizationAttractor : Prop

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse