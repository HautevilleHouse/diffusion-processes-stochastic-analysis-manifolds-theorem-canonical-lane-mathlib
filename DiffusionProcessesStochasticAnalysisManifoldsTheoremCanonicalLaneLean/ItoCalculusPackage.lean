import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheorem

structure ItocaculusPackage {M : Type u} [TopologicalSpace M] [CompactManifold M] (S : StochasticDiffusionPackage M) where
  stochasticIntegral : Type v
  quadraticVariation : Type w
  itoFormula : Prop
  integrationByParts : Prop

structure ItocaculusEvidence {M : Type u} [TopologicalSpace M] [CompactManifold M] {S : StochasticDiffusionPackage M} (I : ItocaculusPackage S) where
  itoFormulaClosed : I.itoFormula
  integrationByPartsClosed : I.integrationByParts

def ItocaculusClosed {M : Type u} [TopologicalSpace M] [CompactManifold M] {S : StochasticDiffusionPackage M} (I : ItocaculusPackage S) : Prop :=
  I.itoFormula ∧ I.integrationByParts

theorem itocaculus_closed_from_evidence {M : Type u} [TopologicalSpace M] [CompactManifold M] {S : StochasticDiffusionPackage M} (I : ItocaculusPackage S) (E : ItocaculusEvidence I) :
    ItocaculusClosed I := by
  exact And.intro E.itoFormulaClosed E.integrationByPartsClosed

end DiffusionProcessesStochasticAnalysisManifoldsTheorem
end HautevilleHouse