import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure StochasticAnalysisPackage (M : DiffusedSpace) where
  brownianMotion : Type
  stochasticIntegral : Type
  itoFormula : Prop
  martingaleRepresentation : Prop
  sdeExistenceUniqueness : Prop

structure StochasticAnalysisEvidence {M : DiffusedSpace} (S : StochasticAnalysisPackage M) where
  itoFormulaClosed : S.itoFormula
  martingaleRepresentationClosed : S.martingaleRepresentation
  sdeExistenceUniquenessClosed : S.sdeExistenceUniqueness

def StochasticAnalysisClosed {M : DiffusedSpace} (S : StochasticAnalysisPackage M) : Prop :=
  S.itoFormula ∧ S.martingaleRepresentation ∧ S.sdeExistenceUniqueness

theorem stochastic_analysis_closed_from_evidence
    {M : DiffusedSpace} (S : StochasticAnalysisPackage M) (E : StochasticAnalysisEvidence S) :
    StochasticAnalysisClosed S := by
  exact And.intro E.itoFormulaClosed
    (And.intro E.martingaleRepresentationClosed E.sdeExistenceUniquenessClosed)

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
