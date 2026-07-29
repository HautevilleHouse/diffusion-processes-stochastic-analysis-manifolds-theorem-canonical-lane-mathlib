import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure ItoCalculusManifoldPackage where
  semiMartingale : Type u
  quadraticVariation : Type v
  itoFormulaOnManifold : Prop
  stochasticIntegral : Prop
  itoIsometry : Prop
  itoFormulaOnManifoldTerm : itoFormulaOnManifold
  stochasticIntegralTerm : stochasticIntegral
  itoIsometryTerm : itoIsometry

structure ItoCalculusManifoldEvidence (I : ItoCalculusManifoldPackage) where
  itoFormulaClosed : I.itoFormulaOnManifold
  stochasticIntegralClosed : I.stochasticIntegral
  itoIsometryClosed : I.itoIsometry

def ItoCalculusManifoldClosed (I : ItoCalculusManifoldPackage) : Prop :=
  I.itoFormulaOnManifold ∧ I.stochasticIntegral ∧ I.itoIsometry

theorem ito_calculus_manifold_closed_from_evidence
    (I : ItoCalculusManifoldPackage) (E : ItoCalculusManifoldEvidence I) :
    ItoCalculusManifoldClosed I := by
  exact And.intro E.itoFormulaClosed (And.intro E.stochasticIntegralClosed E.itoIsometryClosed)

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
