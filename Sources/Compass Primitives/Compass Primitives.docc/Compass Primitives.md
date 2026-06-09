# ``Compass_Primitives``

@Metadata {
    @DisplayName("Compass Primitives")
    @TitleHeading("Swift Institute — Primitives Layer")
}

Compass-bearing named views — `Compass.Cardinal`, the four cardinal directions.

## Overview

`Compass Primitives` ships ``Compass_Primitive/Compass/Cardinal``, a thin named view over the four facets of a 2D box (`Facet<2>`) and the cyclic group `Cyclic.Group.Static<4>`. It has its own canonical case order (clockwise from north) and identity — a *compass bearing*, deliberately distinct from `Boundary.Edge`, which shares the `Facet<2>` carrier but denotes a box edge (the distinction the spatial-atoms arc exists to preserve).

The carrier projections are lossless and live in bridge packages — `.facet` in `swift-compass-facet-primitives`, `.cyclic` in `swift-compass-cyclic-primitives` — so a consumer of the bare enum pays for neither.

## Topics

### Essentials

- <doc:Compass-Scope>

### Core Type

- ``Compass_Primitive/Compass/Cardinal``
