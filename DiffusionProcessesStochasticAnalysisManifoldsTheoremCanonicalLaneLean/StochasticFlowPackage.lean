import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.ItoCalculusPackage

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure StochasticFlowPackage {M : DiffusionStochasticManifold} (I : ItoCalculusPackage M) where
  solutionExists : Prop
  pathwiseUniqueness : Prop
  markovProperty : Prop
  invariantMeasure : Prop

def StochasticFlowClosed {M : DiffusionStochasticManifold} {I : ItoCalculusPackage M} (S : StochasticFlowPackage I) : Prop :=
  S.solutionExists ∧ S.pathwiseUniqueness ∧ S.markovProperty ∧ S.invariantMeasure

structure StochasticFlowEvidence {M : DiffusionStochasticManifold} {I : ItoCalculusPackage M} (S : StochasticFlowPackage I) where
  solutionExistsClosed : S.solutionExists
  pathwiseUniquenessClosed : S.pathwiseUniqueness
  markovPropertyClosed : S.markovProperty
  invariantMeasureClosed : S.invariantMeasure

theorem stochastic_flow_closed_from_evidence {M : DiffusionStochasticManifold} {I : ItoCalculusPackage M} (S : StochasticFlowPackage I) (E : StochasticFlowEvidence S) : StochasticFlowClosed S := by
  exact And.intro E.solutionExistsClosed (And.intro E.pathwiseUniquenessClosed (And.intro E.markovPropertyClosed E.invariantMeasureClosed))

end HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse