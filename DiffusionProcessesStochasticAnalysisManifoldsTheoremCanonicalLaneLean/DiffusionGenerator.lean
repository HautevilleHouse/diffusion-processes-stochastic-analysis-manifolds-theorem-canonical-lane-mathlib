import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean.AdmissibleClass
import Mathlib.Analysis.Calculus.DiffOn

/-!
# Diffusion Generator Package

This module defines the infinitesimal generator of a diffusion process on a manifold,
which is a second-order elliptic operator acting on smooth functions.
-/

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure DiffusionGeneratorPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothAtlas : Type v
  driftVectorField : Type w
  diffusionCoefficient : Type x
  generator : Type y
  generatorDomain : Prop
  generatorActingOnSmoothFunctions : Prop
  secondOrderElliptic : Prop
  satisfiesMaximumPrinciple : Prop

structure DiffusionGeneratorEvidence (G : DiffusionGeneratorPackage) where
  generatorDomainClosed : G.generatorDomain
  generatorActingOnSmoothFunctionsClosed : G.generatorActingOnSmoothFunctions
  secondOrderEllipticClosed : G.secondOrderElliptic
  satisfiesMaximumPrincipleClosed : G.satisfiesMaximumPrinciple

def DiffusionGeneratorClosed (G : DiffusionGeneratorPackage) : Prop :=
  G.generatorDomain ∧ G.generatorActingOnSmoothFunctions ∧
  G.secondOrderElliptic ∧ G.satisfiesMaximumPrinciple

theorem diffusion_generator_closed_from_evidence
    (G : DiffusionGeneratorPackage) (E : DiffusionGeneratorEvidence G) :
    DiffusionGeneratorClosed G := by
  exact And.intro E.generatorDomainClosed
    (And.intro E.generatorActingOnSmoothFunctionsClosed
      (And.intro E.secondOrderEllipticClosed E.satisfiesMaximumPrincipleClosed))

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse