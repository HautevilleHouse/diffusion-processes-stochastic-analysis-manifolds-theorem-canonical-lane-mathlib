import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure StochasticGeodesicFlowPackage where
  geodesicFlow : Type u
  stochasticPerturbation : Type v
  almostSureConvergence : Prop
  stochasticStability : Prop
  largeDeviationsPrinciple : Prop
  almostSureConvergenceTerm : almostSureConvergence
  stochasticStabilityTerm : stochasticStability
  largeDeviationsPrincipleTerm : largeDeviationsPrinciple

structure StochasticGeodesicFlowEvidence (G : StochasticGeodesicFlowPackage) where
  almostSureConvergenceClosed : G.almostSureConvergence
  stochasticStabilityClosed : G.stochasticStability
  largeDeviationsPrincipleClosed : G.largeDeviationsPrinciple

def StochasticGeodesicFlowClosed (G : StochasticGeodesicFlowPackage) : Prop :=
  G.almostSureConvergence ∧ G.stochasticStability ∧ G.largeDeviationsPrinciple

theorem stochastic_geodesic_flow_closed_from_evidence
    (G : StochasticGeodesicFlowPackage) (E : StochasticGeodesicFlowEvidence G) :
    StochasticGeodesicFlowClosed G := by
  exact And.intro E.almostSureConvergenceClosed (And.intro E.stochasticStabilityClosed E.largeDeviationsPrincipleClosed)

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
