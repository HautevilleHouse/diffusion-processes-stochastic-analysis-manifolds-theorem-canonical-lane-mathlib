import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure GeometricAnalysisPackage (M : DiffusedSpace) where
  laplacianComparison : Prop
  bochnerWeitzenbock : Prop
  stochasticCompleteness : Prop
  brownianMotionConvergence : Prop

structure GeometricAnalysisEvidence {M : DiffusedSpace} (G : GeometricAnalysisPackage M) where
  laplacianComparisonClosed : G.laplacianComparison
  bochnerWeitzenbockClosed : G.bochnerWeitzenbock
  stochasticCompletenessClosed : G.stochasticCompleteness
  brownianMotionConvergenceClosed : G.brownianMotionConvergence

def GeometricAnalysisClosed {M : DiffusedSpace} (G : GeometricAnalysisPackage M) : Prop :=
  G.laplacianComparison ∧ G.bochnerWeitzenbock ∧ G.stochasticCompleteness ∧ G.brownianMotionConvergence

theorem geometric_analysis_closed_from_evidence
    {M : DiffusedSpace} (G : GeometricAnalysisPackage M) (E : GeometricAnalysisEvidence G) :
    GeometricAnalysisClosed G := by
  exact And.intro E.laplacianComparisonClosed
    (And.intro E.bochnerWeitzenbockClosed
      (And.intro E.stochasticCompletenessClosed E.brownianMotionConvergenceClosed))

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
