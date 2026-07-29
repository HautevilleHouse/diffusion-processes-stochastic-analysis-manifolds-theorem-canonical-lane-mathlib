import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure DiffusedSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  manifold : Type
  manifoldTopology : TopologicalSpace manifold
  diffusion : Type

structure DiffusedAdmittedObject where
  space : DiffusedSpace
  completeRiemannianManifold : Prop
  stochasticProcessDefined : Prop
  sdeSolution : Prop
  heatKernelBounds : Prop
  conclusion : sdeSolution ∧ heatKernelBounds

structure DiffusionEndgameState where
  object : DiffusedAdmittedObject

def DiffusionWitnessClosed (O : DiffusedAdmittedObject) : Prop :=
  O.sdeSolution ∧ O.heatKernelBounds

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
