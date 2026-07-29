import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure DiffusionPDEPackage (M : DiffusedSpace) where
  timeParameter : Type
  infinitesimalGenerator : Type
  fokkerPlanckEquation : Prop
  initialCondition : Prop
  boundaryCondition : Prop

structure DiffusionPDEEvidence {M : DiffusedSpace} (P : DiffusionPDEPackage M) where
  fokkerPlanckEquationClosed : P.fokkerPlanckEquation
  initialConditionClosed : P.initialCondition
  boundaryConditionClosed : P.boundaryCondition

def DiffusionPDEClosed {M : DiffusedSpace} (P : DiffusionPDEPackage M) : Prop :=
  P.fokkerPlanckEquation ∧ P.initialCondition ∧ P.boundaryCondition

theorem diffusion_pde_closed_from_evidence
    {M : DiffusedSpace} (P : DiffusionPDEPackage M) (E : DiffusionPDEEvidence P) :
    DiffusionPDEClosed P := by
  exact And.intro E.fokkerPlanckEquationClosed
    (And.intro E.initialConditionClosed E.boundaryConditionClosed)

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
