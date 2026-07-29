import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean

structure ItôCalculusOnManifoldsPackage (M : Type u) [TopologicalSpace M] [MetricSpace M] where
  manifoldDimension : Nat
  tangentBundle : Type v
  itôIntegral : Type w
  semiMartingaleProcess : Type x
  itôFormula : Prop
  stratonovichConversion : Prop
  parallelTransport : Prop
  stochasticLineIntegrals : Prop
  invarianceUnderDiff : Prop

structure ItôCalculusOnManifoldsEvidence {M : Type u} [TopologicalSpace M] [MetricSpace M]
    (Pkg : ItôCalculusOnManifoldsPackage M) where
  itôFormulaClosed : Pkg.itôFormula
  stratonovichConversionClosed : Pkg.stratonovichConversion
  parallelTransportClosed : Pkg.parallelTransport
  stochasticLineIntegralsClosed : Pkg.stochasticLineIntegrals
  invarianceUnderDiffClosed : Pkg.invarianceUnderDiff

def ItôCalculusOnManifoldsClosed {M : Type u} [TopologicalSpace M] [MetricSpace M]
    (Pkg : ItôCalculusOnManifoldsPackage M) : Prop :=
  Pkg.itôFormula ∧
  Pkg.stratonovichConversion ∧
  Pkg.parallelTransport ∧
  Pkg.stochasticLineIntegrals ∧
  Pkg.invarianceUnderDiff

theorem ito_calculus_on_manifolds_closed_from_evidence
    {M : Type u} [TopologicalSpace M] [MetricSpace M]
    (Pkg : ItôCalculusOnManifoldsPackage M) (E : ItôCalculusOnManifoldsEvidence Pkg) :
    ItôCalculusOnManifoldsClosed Pkg := by
  exact And.intro E.itôFormulaClosed
    (And.intro E.stratonovichConversionClosed
      (And.intro E.parallelTransportClosed
        (And.intro E.stochasticLineIntegralsClosed
          E.invarianceUnderDiffClosed)))

end DiffusionProcessesStochasticAnalysisManifoldsTheoremCanonicalLaneLean
end HautevilleHouse