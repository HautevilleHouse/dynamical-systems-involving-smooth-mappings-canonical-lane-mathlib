import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean

structure BifurcationPoint where
  parameterValue : ℝ
  qualitativeChange : Prop
  bifurcationType : String
  localNormalForm : Prop

structure PeriodDoublingCascade where
  bifurcationSequence : List BifurcationPoint
  accumulationPoint : ℝ
  scalingLaw : Prop
  universality : Prop

structure HopfBifurcationPackage where
  parameterValue : ℝ
  periodicOrbitEmergence : Prop
  stabilityExchange : Prop
  normalFormComputed : Prop

structure LyapunovExponentPackage where
  exponent : ℝ
  signDetermined : Prop
  chaosIndicator : Prop
  computationMethod : String

structure ChaosEvidence where
  lyapunovExponentPositive : LyapunovExponentPackage
  strangeAttractorPresent : AttractorStructurePackage
  sensitiveDependenceOnInitialConditions : Prop
  topologicalMixing : Prop
  densePeriodicOrbits : Prop

structure BifurcationEvidence (B : BifurcationPoint) where
  parameterValueClosed : B.parameterValue = B.parameterValue
  qualitativeChangeClosed : B.qualitativeChange

structure LyapunovChaosEvidence (L : LyapunovExponentPackage) where
  exponentPositiveClosed : L.exponent > 0
  chaosIndicatorClosed : L.chaosIndicator

end DynamicalSystemsInvolvingSmoothMappingsCanonicalLaneLean
end HautevilleHouse