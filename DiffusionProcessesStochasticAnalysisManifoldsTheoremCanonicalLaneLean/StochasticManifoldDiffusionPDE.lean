import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure StochasticManifoldDiffusionPDEPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  metric : Type v
  stochasticProcess : Type w
  driftField : Type x
  diffusionCoefficient : Type y
  pdeConstraint : Prop
  adaptedCondition : Prop
  initialCondition : Prop
  pdeConstraintTerm : pdeConstraint
  adaptedConditionTerm : adaptedCondition
  initialConditionTerm : initialCondition

structure StochasticManifoldDiffusionPDEEvidence (P : StochasticManifoldDiffusionPDEPackage) where
  pdeConstraintClosed : P.pdeConstraint
  adaptedConditionClosed : P.adaptedCondition
  initialConditionClosed : P.initialCondition

def StochasticManifoldDiffusionPDEClosed (P : StochasticManifoldDiffusionPDEPackage) : Prop :=
  P.pdeConstraint ∧ P.adaptedCondition ∧ P.initialCondition

theorem stochastic_manifold_diffusion_pde_closed_from_evidence
    (P : StochasticManifoldDiffusionPDEPackage) (E : StochasticManifoldDiffusionPDEEvidence P) :
    StochasticManifoldDiffusionPDEClosed P := by
  exact And.intro E.pdeConstraintClosed (And.intro E.adaptedConditionClosed E.initialConditionClosed)

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
