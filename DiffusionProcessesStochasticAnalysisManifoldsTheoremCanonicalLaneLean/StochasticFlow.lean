import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.DiffusionGenerator

/-!
# Stochastic Flow Package

This module defines the stochastic flow associated with a diffusion process on a manifold,
capturing the evolution of the process over time.
-/

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure StochasticFlowPackage {G : DiffusionGeneratorPackage} where
  timeDomain : Type u
  initialDistribution : Type v
  samplePath : Type w
  flowMap : G.manifold → timeDomain → G.manifold
  markovProperty : Prop
  strongMarkovProperty : Prop
  sampleContinuity : Prop
  flowMapMeasurable : Prop

structure StochasticFlowEvidence {G : DiffusionGeneratorPackage}
    (F : StochasticFlowPackage G) where
  markovPropertyClosed : F.markovProperty
  strongMarkovPropertyClosed : F.strongMarkovProperty
  sampleContinuityClosed : F.sampleContinuity
  flowMapMeasurableClosed : F.flowMapMeasurable

def StochasticFlowClosed {G : DiffusionGeneratorPackage}
    (F : StochasticFlowPackage G) : Prop :=
  F.markovProperty ∧ F.strongMarkovProperty ∧
  F.sampleContinuity ∧ F.flowMapMeasurable

theorem stochastic_flow_closed_from_evidence
    {G : DiffusionGeneratorPackage} (F : StochasticFlowPackage G)
    (E : StochasticFlowEvidence F) : StochasticFlowClosed F := by
  exact And.intro E.markovPropertyClosed
    (And.intro E.strongMarkovPropertyClosed
      (And.intro E.sampleContinuityClosed E.flowMapMeasurableClosed))

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse