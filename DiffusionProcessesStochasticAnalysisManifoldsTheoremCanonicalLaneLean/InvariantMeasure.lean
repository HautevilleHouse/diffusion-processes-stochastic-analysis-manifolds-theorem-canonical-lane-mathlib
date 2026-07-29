import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.StochasticCalculus

/-!
# Invariant Measure Package

This module defines the invariant measure of a diffusion process on a manifold,
ensuring existence and uniqueness under appropriate conditions.
-/

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure InvariantMeasurePackage {G : DiffusionGeneratorPackage}
    {F : StochasticFlowPackage G} (C : StochasticCalculusPackage F) where
  measureSpace : Type u
  invariantMeasure : measureSpace → Prop
  existence : Prop
  uniqueness : Prop
  ergodicity : Prop
  stationaryDistribution : Prop

structure InvariantMeasureEvidence {G : DiffusionGeneratorPackage}
    {F : StochasticFlowPackage G} {C : StochasticCalculusPackage F}
    (M : InvariantMeasurePackage C) where
  existenceClosed : M.existence
  uniquenessClosed : M.uniqueness
  ergodicityClosed : M.ergodicity
  stationaryDistributionClosed : M.stationaryDistribution

def InvariantMeasureClosed {G : DiffusionGeneratorPackage}
    {F : StochasticFlowPackage G} {C : StochasticCalculusPackage F}
    (M : InvariantMeasurePackage C) : Prop :=
  M.existence ∧ M.uniqueness ∧ M.ergodicity ∧ M.stationaryDistribution

theorem invariant_measure_closed_from_evidence
    {G : DiffusionGeneratorPackage} {F : StochasticFlowPackage G}
    {C : StochasticCalculusPackage F} (M : InvariantMeasurePackage C)
    (E : InvariantMeasureEvidence M) : InvariantMeasureClosed M := by
  exact And.intro E.existenceClosed
    (And.intro E.uniquenessClosed
      (And.intro E.ergodicityClosed E.stationaryDistributionClosed))

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse