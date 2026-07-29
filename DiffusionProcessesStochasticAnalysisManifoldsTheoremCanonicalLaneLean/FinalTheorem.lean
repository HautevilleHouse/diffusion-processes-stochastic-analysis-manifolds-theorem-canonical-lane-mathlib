import canonicalLaneMathlib.AdmissibleClass
import DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.StochasticHeatKernel
import DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.ItôCalculusOnManifolds

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

def ConstrainedDiffusionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_diffusion_endgame (A : AdmissibleClass) :
    ConstrainedDiffusionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse