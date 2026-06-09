// Compass.Cardinal+Comparison.Protocol.swift
// Conformance of Compass.Cardinal to Comparison.Protocol — unconditional.
//
// The `<` / `<=` / `>` / `>=` witnesses (clockwise rank) live in the root. Enums are not
// auto-Comparable, so the stdlib `Comparable` conformance is declared here, guarded
// `#if swift(<6.4)`; on 6.4+ Comparison.Protocol is a typealias to Swift.Comparable.

public import Comparison_Primitives
public import Compass_Primitive

extension Compass.Cardinal: Comparison.`Protocol` {}

#if swift(<6.4)
    extension Compass.Cardinal: Comparable {}
#endif
