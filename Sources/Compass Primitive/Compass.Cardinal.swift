// Compass.Cardinal.swift
// The four cardinal compass directions.

extension Compass {
    /// The four cardinal compass directions, in clockwise order from north.
    ///
    /// `Compass.Cardinal` is a thin named view over the four facets of a 2D box (`Facet<2>`)
    /// and the cyclic group `Cyclic.Group.Static<4>`, with its own canonical case order and
    /// identity (compass bearing — distinct from `Boundary.Edge`, which shares the `Facet<2>`
    /// carrier but means a box edge). The lossless carrier projections (`.facet`, `.cyclic`)
    /// live in the `swift-compass-facet-primitives` / `swift-compass-cyclic-primitives`
    /// bridge packages.
    public enum Cardinal: Sendable, CaseIterable {
        /// North (+Y).
        case north
        /// East (+X).
        case east
        /// South (−Y).
        case south
        /// West (−X).
        case west
    }
}

// MARK: - Semantics

extension Compass.Cardinal {
    /// The opposite cardinal direction (north ↔ south, east ↔ west).
    @inlinable
    public var opposite: Compass.Cardinal {
        switch self {
        case .north: .south
        case .east: .west
        case .south: .north
        case .west: .east
        }
    }

    /// The next direction clockwise (north → east → south → west → north).
    @inlinable
    public var clockwise: Compass.Cardinal {
        switch self {
        case .north: .east
        case .east: .south
        case .south: .west
        case .west: .north
        }
    }

    /// The next direction counter-clockwise.
    @inlinable
    public var counterclockwise: Compass.Cardinal {
        switch self {
        case .north: .west
        case .west: .south
        case .south: .east
        case .east: .north
        }
    }
}

// MARK: - Equality, Hashing, Ordering

// Compass.Cardinal is a payload-less enum (implicitly Equatable/Hashable). The full
// ==/</<=/>/>= + hash(into:) set is declared here in the type's own module so it witnesses
// both the implicit stdlib conformances and the institute Equation/Hash/Comparison twins
// (whose <6.4 fork forms need explicitly-declared `borrowing` witnesses). Ordered by the
// clockwise rank that also indexes the type under Finite.Enumerable.

extension Compass.Cardinal {
    @usableFromInline
    var _rank: Int {
        switch self {
        case .north: 0
        case .east: 1
        case .south: 2
        case .west: 3
        }
    }

    /// Whether two cardinal directions are the same direction.
    @inlinable
    public static func == (lhs: Compass.Cardinal, rhs: Compass.Cardinal) -> Bool {
        lhs._rank == rhs._rank
    }

    /// Whether the left direction precedes the right in clockwise rank (north < east < south < west).
    @inlinable
    public static func < (lhs: Compass.Cardinal, rhs: Compass.Cardinal) -> Bool {
        lhs._rank < rhs._rank
    }

    /// Whether the left direction precedes or equals the right in clockwise rank.
    @inlinable
    public static func <= (lhs: Compass.Cardinal, rhs: Compass.Cardinal) -> Bool {
        lhs._rank <= rhs._rank
    }

    /// Whether the left direction follows the right in clockwise rank.
    @inlinable
    public static func > (lhs: Compass.Cardinal, rhs: Compass.Cardinal) -> Bool {
        lhs._rank > rhs._rank
    }

    /// Whether the left direction follows or equals the right in clockwise rank.
    @inlinable
    public static func >= (lhs: Compass.Cardinal, rhs: Compass.Cardinal) -> Bool {
        lhs._rank >= rhs._rank
    }

    /// Feeds the direction's clockwise rank into the given hasher.
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rank)
    }
}

// MARK: - Codable

#if !hasFeature(Embedded)
    extension Compass.Cardinal: Codable {}
#endif
