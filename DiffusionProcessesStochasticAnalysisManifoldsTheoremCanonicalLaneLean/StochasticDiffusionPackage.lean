import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheorem

structure StochasticDiffusionPackage {M : Type u} [TopologicalSpace M] [CompactManifold M] where
  manifoldM : M
  diffProcessParams : Type v
  itoInfinitesimalGenerator : Type w
  diffusionEquation : Prop
  uniqueWeakSolution : Prop
  markovProperty : Prop

structure StochasticDiffusionEvidence {M : Type u} [TopologicalSpace M] [CompactManifold M] (S : StochasticDiffusionPackage M) where
  diffusionEquationClosed : S.diffusionEquation
  uniqueWeakSolutionClosed : S.uniqueWeakSolution
  markovPropertyClosed : S.markovProperty

def StochasticDiffusionClosed {M : Type u} [TopologicalSpace M] [CompactManifold M] (S : StochasticDiffusionPackage M) : Prop :=
  S.diffusionEquation ∧ S.uniqueWeakSolution ∧ S.markovProperty

theorem stochastic_diffusion_closed_from_evidence {M : Type u} [TopologicalSpace M] [CompactManifold M] (S : StochasticDiffusionPackage M) (E : StochasticDiffusionEvidence S) :
    StochasticDiffusionClosed S := by
  exact And.intro E.diffusionEquationClosed (And.intro E.uniqueWeakSolutionClosed E.markovPropertyClosed)

end DiffusionProcessesStochasticAnalysisManifoldsTheorem
end HautevilleHouse