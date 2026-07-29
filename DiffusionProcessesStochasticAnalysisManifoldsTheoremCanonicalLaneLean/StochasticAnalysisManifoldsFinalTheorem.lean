import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.SDEBridgeLemmas

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

def ConstrainedDiffusionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_diffusion_endgame (A : AdmissibleClass) :
    ConstrainedDiffusionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse