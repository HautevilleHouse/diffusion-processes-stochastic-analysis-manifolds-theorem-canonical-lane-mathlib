import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure DiffusionStochasticManifold where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Prop
  dimension : Nat
  dimensionEqN : dimension = 1
  riemannianMetric : Prop

structure AdmittedDiffusionObject where
  manifoldData : DiffusionStochasticManifold
  generator : Prop
  martingaleProblem : Prop
  transitionSemigroup : Prop
  conclusion : generator ∧ martingaleProblem ∧ transitionSemigroup

structure DiffusionEndgameState where
  object : AdmittedDiffusionObject

def DiffusionWitnessClosed (O : AdmittedDiffusionObject) : Prop :=
  O.generator ∧ O.martingaleProblem ∧ O.transitionSemigroup

end HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse