import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.DiffusionStochasticManifold

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | AdmittedDiffusionObject.mk _ g m _ _ => g ∧ m

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  match h : A.object with
  | AdmittedDiffusionObject.mk _ g m s c =>
    have hc : g ∧ m := by
      have := c
      exact And.intro (by exact this.1) (by exact this.2.1)
    exact hc

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse