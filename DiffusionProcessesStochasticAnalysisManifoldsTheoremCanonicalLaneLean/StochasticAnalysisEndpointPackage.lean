import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheorem

structure StochasticAnalysisEndpointPackage {M : Type u} [TopologicalSpace M] [CompactManifold M] (G : StochasticDifferentialGeometryPackage M) where
  invariantManifoldMeasure : Prop
  ergodicity : Prop
  spectralGap : Prop
  convergenceToEquilibrium : Prop

structure StochasticAnalysisEndpointEvidence {M : Type u} [TopologicalSpace M] [CompactManifold M] {G : StochasticDifferentialGeometryPackage M} (E : StochasticAnalysisEndpointPackage G) where
  invariantManifoldMeasureClosed : E.invariantManifoldMeasure
  ergodicityClosed : E.ergodicity
  spectralGapClosed : E.spectralGap
  convergenceToEquilibriumClosed : E.convergenceToEquilibrium

def StochasticAnalysisEndpointClosed {M : Type u} [TopologicalSpace M] [CompactManifold M] {G : StochasticDifferentialGeometryPackage M} (E : StochasticAnalysisEndpointPackage G) : Prop :=
  E.invariantManifoldMeasure ∧ E.ergodicity ∧ E.spectralGap ∧ E.convergenceToEquilibrium

theorem stochastic_analysis_endpoint_closed_from_evidence {M : Type u} [TopologicalSpace M] [CompactManifold M] {G : StochasticDifferentialGeometryPackage M} (E : StochasticAnalysisEndpointPackage G) (Ev : StochasticAnalysisEndpointEvidence E) :
    StochasticAnalysisEndpointClosed E := by
  exact And.intro Ev.invariantManifoldMeasureClosed (And.intro Ev.ergodicityClosed (And.intro Ev.spectralGapClosed Ev.convergenceToEquilibriumClosed))

end DiffusionProcessesStochasticAnalysisManifoldsTheorem
end HautevilleHouse