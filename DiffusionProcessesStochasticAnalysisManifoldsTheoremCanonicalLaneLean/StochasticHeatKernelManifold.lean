import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure StochasticHeatKernelManifoldPackage where
  heatKernel : Type u
  asymptotics : Type v
  smallTimeAsymptotics : Prop
  varadhanFormula : Prop
  heatKernelUpperBound : Prop
  smallTimeAsymptoticsTerm : smallTimeAsymptotics
  varadhanFormulaTerm : varadhanFormula
  heatKernelUpperBoundTerm : heatKernelUpperBound

structure StochasticHeatKernelManifoldEvidence (K : StochasticHeatKernelManifoldPackage) where
  smallTimeAsymptoticsClosed : K.smallTimeAsymptotics
  varadhanFormulaClosed : K.varadhanFormula
  heatKernelUpperBoundClosed : K.heatKernelUpperBound

def StochasticHeatKernelManifoldClosed (K : StochasticHeatKernelManifoldPackage) : Prop :=
  K.smallTimeAsymptotics ∧ K.varadhanFormula ∧ K.heatKernelUpperBound

theorem stochastic_heat_kernel_manifold_closed_from_evidence
    (K : StochasticHeatKernelManifoldPackage) (E : StochasticHeatKernelManifoldEvidence K) :
    StochasticHeatKernelManifoldClosed K := by
  exact And.intro E.smallTimeAsymptoticsClosed (And.intro E.varadhanFormulaClosed E.heatKernelUpperBoundClosed)

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
