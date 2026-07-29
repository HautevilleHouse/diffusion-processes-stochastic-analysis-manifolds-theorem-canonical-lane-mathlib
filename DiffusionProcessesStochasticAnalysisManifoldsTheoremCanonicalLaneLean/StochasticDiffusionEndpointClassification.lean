import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure StochasticDiffusionEndpointPackage where
  targetManifold : Type u
  targetTopology : TopologicalSpace targetManifold
  ergodicStationaryDistribution : Prop
  invariantMeasureUniqueness : Prop
  mixingRate : Prop
  ergodicStationaryDistributionTerm : ergodicStationaryDistribution
  invariantMeasureUniquenessTerm : invariantMeasureUniqueness
  mixingRateTerm : mixingRate

structure StochasticDiffusionEndpointEvidence (E : StochasticDiffusionEndpointPackage) where
  ergodicStationaryDistributionClosed : E.ergodicStationaryDistribution
  invariantMeasureUniquenessClosed : E.invariantMeasureUniqueness
  mixingRateClosed : E.mixingRate

def StochasticDiffusionEndpointClosed (E : StochasticDiffusionEndpointPackage) : Prop :=
  E.ergodicStationaryDistribution ∧ E.invariantMeasureUniqueness ∧ E.mixingRate

theorem stochastic_diffusion_endpoint_closed_from_evidence
    (E : StochasticDiffusionEndpointPackage) (Ev : StochasticDiffusionEndpointEvidence E) :
    StochasticDiffusionEndpointClosed E := by
  exact And.intro Ev.ergodicStationaryDistributionClosed (And.intro Ev.invariantMeasureUniquenessClosed Ev.mixingRateClosed)

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
