import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure HeatKernelEstimatesPackage (M : DiffusedSpace) where
  heatKernel : Type
  gaussianBounds : Prop
  liYauInequality : Prop
  parabolicHarnack : Prop
  shortTimeAsymptotics : Prop

structure HeatKernelEstimatesEvidence {M : DiffusedSpace} (H : HeatKernelEstimatesPackage M) where
  gaussianBoundsClosed : H.gaussianBounds
  liYauInequalityClosed : H.liYauInequality
  parabolicHarnackClosed : H.parabolicHarnack
  shortTimeAsymptoticsClosed : H.shortTimeAsymptotics

def HeatKernelEstimatesClosed {M : DiffusedSpace} (H : HeatKernelEstimatesPackage M) : Prop :=
  H.gaussianBounds ∧ H.liYauInequality ∧ H.parabolicHarnack ∧ H.shortTimeAsymptotics

theorem heat_kernel_estimates_closed_from_evidence
    {M : DiffusedSpace} (H : HeatKernelEstimatesPackage M) (E : HeatKernelEstimatesEvidence H) :
    HeatKernelEstimatesClosed H := by
  exact And.intro E.gaussianBoundsClosed
    (And.intro E.liYauInequalityClosed
      (And.intro E.parabolicHarnackClosed E.shortTimeAsymptoticsClosed))

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
