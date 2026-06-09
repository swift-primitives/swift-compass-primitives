# Compass Scope

The identity surface of `swift-compass-primitives` and what it deliberately excludes.

## Identity

`swift-compass-primitives` provides **compass-bearing named views** — currently
`Compass.Cardinal`, the four cardinal directions (north/east/south/west) in clockwise
canonical order. It is a thin nominal type with its own identity over the `Facet<2>` and
`Cyclic.Group.Static<4>` carriers — NOT a typealias to either (same carrier ≠ same type).

## Core targets

- `Compass Primitive` — the `Compass` namespace + the `Compass.Cardinal` enum, its semantics
  (`opposite`, `clockwise`, `counterclockwise`), stdlib `CaseIterable` (synthesized in-file),
  and conditional `Codable`. Zero external dependencies ([MOD-017]).
- `Compass Equation / Hash / Comparison Primitives` — the institute Equatable/Hashable/
  Comparable twins (ordered clockwise).

The named view is a payload-less enum with synthesized `CaseIterable` (matching the prior
`Region.Cardinal`); enumeration ordinals are projected onto carriers by the bridge packages,
so it carries no `Finite.Enumerable` (and no finite/ordinal dependency).

## Out of scope

- The `Facet<2>` / `Cyclic.Group.Static<4>` carriers and the `.facet` / `.cyclic`
  projections: the `swift-compass-facet-primitives` / `swift-compass-cyclic-primitives`
  bridge packages (per-carrier, [MOD-014]).
- The box-edge view over the same `Facet<2>` carrier (`Boundary.Edge`):
  `swift-boundary-primitives`.
- Intercardinal (8-wind) or finer compass subdivisions: deferred.

## Evaluation rule

Sub-target additions are evaluated against this scope. If a proposed addition is OUT of
scope, it extracts to a sibling package, not into this one.
