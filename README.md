# swift-compass-primitives

Compass-bearing named views for the Swift Institute primitives layer.

`Compass.Cardinal` is the four cardinal directions (north/east/south/west) in clockwise
canonical order — a thin named view over the `Facet<2>` and `Cyclic.Group.Static<4>`
carriers, with its own identity (a compass bearing, distinct from `Boundary.Edge` over the
same `Facet<2>` carrier).

```swift
import Compass_Primitives

Compass.Cardinal.north.opposite       // .south
Compass.Cardinal.north.clockwise      // .east
Array(Compass.Cardinal.allCases)      // [.north, .east, .south, .west]
```

The lossless carrier projections (`.facet`, `.cyclic`) live in the per-carrier bridge
packages `swift-compass-facet-primitives` and `swift-compass-cyclic-primitives`, so a
consumer of the bare enum pays for neither.

## License

Apache License 2.0. See [LICENSE](LICENSE.md).
