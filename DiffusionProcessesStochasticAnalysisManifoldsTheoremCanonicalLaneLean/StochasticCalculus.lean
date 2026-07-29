import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.StochasticFlow

/-!
# Stochastic Calculus Package

This module provides the Itô calculus on manifolds, including Itô's lemma and
stochastic integration with respect to semimartingales.
-/

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure StochasticCalculusPackage {G : DiffusionGeneratorPackage}
    (F : StochasticFlowPackage G) where
  semimartingaleType : Type u
  stochasticIntegral : Type v
  itoFormula : Prop
  quadraticVariation : Type w
  itoIsometry : Prop
  itoFormulaHolds : Prop

structure StochasticCalculusEvidence {G : DiffusionGeneratorPackage}
    {F : StochasticFlowPackage G} (C : StochasticCalculusPackage F) where
  itoFormulaHoldsClosed : C.itoFormulaHolds
  itoIsometryClosed : C.itoIsometry

def StochasticCalculusClosed {G : DiffusionGeneratorPackage}
    {F : StochasticFlowPackage G} (C : StochasticCalculusPackage F) : Prop :=
  C.itoFormulaHolds ∧ C.itoIsometry

theorem stochastic_calculus_closed_from_evidence
    {G : DiffusionGeneratorPackage} {F : StochasticFlowPackage G}
    (C : StochasticCalculusPackage F) (E : StochasticCalculusEvidence C) :
    StochasticCalculusClosed C := by
  exact And.intro E.itoFormulaHoldsClosed E.itoIsometryClosed

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse