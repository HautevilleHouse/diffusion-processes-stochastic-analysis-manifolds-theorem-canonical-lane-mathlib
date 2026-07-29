import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsTheorem

structure ManifoldHeatKernelPackage {M : Type u} [TopologicalSpace M] [CompactManifold M] (I : ItocaculusPackage M) where
  heatKernel : Type v
  shortTimeAsymptotics : Prop
  parreensKernel : Prop
  heatKernelTrace : Prop

structure ManifoldHeatKernelEvidence {M : Type u} [TopologicalSpace M] [CompactManifold M] {I : ItocaculusPackage M} (H : ManifoldHeatKernelPackage I) where
  shortTimeAsymptoticsClosed : H.shortTimeAsymptotics
  parreensKernelClosed : H.parreensKernel
  heatKernelTraceClosed : H.heatKernelTrace

def ManifoldHeatKernelClosed {M : Type u} [TopologicalSpace M] [CompactManifold M] {I : ItocaculusPackage M} (H : ManifoldHeatKernelPackage I) : Prop :=
  H.shortTimeAsymptotics ∧ H.parreensKernel ∧ H.heatKernelTrace

theorem manifold_heat_kernel_closed_from_evidence {M : Type u} [TopologicalSpace M] [CompactManifold M] {I : ItocaculusPackage M} (H : ManifoldHeatKernelPackage I) (E : ManifoldHeatKernelEvidence H) :
    ManifoldHeatKernelClosed H := by
  exact And.intro E.shortTimeAsymptoticsClosed (And.intro E.parreensKernelClosed E.heatKernelTraceClosed)

end DiffusionProcessesStochasticAnalysisManifoldsTheorem
end HautevilleHouse