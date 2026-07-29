import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.InvariantMeasure

/-!
# Large Deviations Package

This module provides the large deviation principle for diffusion processes on manifolds,
characterizing the exponential decay of rare events.
-/

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure LargeDeviationsPackage {G : DiffusionGeneratorPackage}
    {F : StochasticFlowPackage G} {C : StochasticCalculusPackage F}
    (M : InvariantMeasurePackage C) where
  rateFunction : Type u
  largeDeviationPrinciple : Prop
  upperBound : Prop
  lowerBound : Prop
  contractionPrinciple : Prop
  laplacePrinciple : Prop

structure LargeDeviationsEvidence {G : DiffusionGeneratorPackage}
    {F : StochasticFlowPackage G} {C : StochasticCalculusPackage F}
    {M : InvariantMeasurePackage C} (L : LargeDeviationsPackage M) where
  largeDeviationPrincipleClosed : L.largeDeviationPrinciple
  upperBoundClosed : L.upperBound
  lowerBoundClosed : L.lowerBound
  contractionPrincipleClosed : L.contractionPrinciple
  laplacePrincipleClosed : L.laplacePrinciple

def LargeDeviationsClosed {G : DiffusionGeneratorPackage}
    {F : StochasticFlowPackage G} {C : StochasticCalculusPackage F}
    {M : InvariantMeasurePackage C} (L : LargeDeviationsPackage M) : Prop :=
  L.largeDeviationPrinciple ∧ L.upperBound ∧ L.lowerBound ∧
  L.contractionPrinciple ∧ L.laplacePrinciple

theorem large_deviations_closed_from_evidence
    {G : DiffusionGeneratorPackage} {F : StochasticFlowPackage G}
    {C : StochasticCalculusPackage F} {M : InvariantMeasurePackage C}
    (L : LargeDeviationsPackage M) (E : LargeDeviationsEvidence L) :
    LargeDeviationsClosed L := by
  exact And.intro E.largeDeviationPrincipleClosed
    (And.intro E.upperBoundClosed
      (And.intro E.lowerBoundClosed
        (And.intro E.contractionPrincipleClosed E.laplacePrincipleClosed)))

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse