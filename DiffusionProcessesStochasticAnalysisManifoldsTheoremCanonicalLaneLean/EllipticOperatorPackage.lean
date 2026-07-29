import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.DiffusionStochasticManifold

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure EllipticOperatorPackage (M : DiffusionStochasticManifold) where
  operator : Type u
  strongMaximumPrinciple : Prop
  spectralGap : Prop
  heatKernelEstimates : Prop

def EllipticOperatorClosed {M : DiffusionStochasticManifold} (E : EllipticOperatorPackage M) : Prop :=
  E.strongMaximumPrinciple ∧ E.spectralGap ∧ E.heatKernelEstimates

structure EllipticOperatorEvidence {M : DiffusionStochasticManifold} (E : EllipticOperatorPackage M) where
  strongMaximumPrincipleClosed : E.strongMaximumPrinciple
  spectralGapClosed : E.spectralGap
  heatKernelEstimatesClosed : E.heatKernelEstimates

theorem elliptic_operator_closed_from_evidence {M : DiffusionStochasticManifold} (E : EllipticOperatorPackage M) (Ev : EllipticOperatorEvidence E) : EllipticOperatorClosed E := by
  exact And.intro Ev.strongMaximumPrincipleClosed (And.intro Ev.spectralGapClosed Ev.heatKernelEstimatesClosed)

end HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse