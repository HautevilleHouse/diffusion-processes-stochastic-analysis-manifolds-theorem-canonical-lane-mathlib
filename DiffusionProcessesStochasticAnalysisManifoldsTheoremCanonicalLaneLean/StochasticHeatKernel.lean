import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure StochasticHeatKernelPackage (M : Type u) [TopologicalSpace M] [MetricSpace M] where
  timeParameter : Type v
  diffusionOperator : Type w
  heatKernelFunction : Type x
  shortTimeAsymptoticExpansion : Prop
  diagonalEstimate : Prop
  gradientEstimate : Prop
  markovProperty : Prop
  stochasticFlowDefined : Prop
  connectionWithRiemannianGeometry : Prop

structure StochasticHeatKernelEvidence {M : Type u} [TopologicalSpace M] [MetricSpace M]
    (Pkg : StochasticHeatKernelPackage M) where
  shortTimeAsymptoticExpansionClosed : Pkg.shortTimeAsymptoticExpansion
  diagonalEstimateClosed : Pkg.diagonalEstimate
  gradientEstimateClosed : Pkg.gradientEstimate
  markovPropertyClosed : Pkg.markovProperty
  stochasticFlowDefinedClosed : Pkg.stochasticFlowDefined
  connectionWithRiemannianGeometryClosed : Pkg.connectionWithRiemannianGeometry

def StochasticHeatKernelClosed {M : Type u} [TopologicalSpace M] [MetricSpace M]
    (Pkg : StochasticHeatKernelPackage M) : Prop :=
  Pkg.shortTimeAsymptoticExpansion ∧
  Pkg.diagonalEstimate ∧
  Pkg.gradientEstimate ∧
  Pkg.markovProperty ∧
  Pkg.stochasticFlowDefined ∧
  Pkg.connectionWithRiemannianGeometry

theorem stochastic_heat_kernel_closed_from_evidence
    {M : Type u} [TopologicalSpace M] [MetricSpace M]
    (Pkg : StochasticHeatKernelPackage M) (E : StochasticHeatKernelEvidence Pkg) :
    StochasticHeatKernelClosed Pkg := by
  exact And.intro E.shortTimeAsymptoticExpansionClosed
    (And.intro E.diagonalEstimateClosed
      (And.intro E.gradientEstimateClosed
        (And.intro E.markovPropertyClosed
          (And.intro E.stochasticFlowDefinedClosed
            E.connectionWithRiemannianGeometryClosed))))

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse