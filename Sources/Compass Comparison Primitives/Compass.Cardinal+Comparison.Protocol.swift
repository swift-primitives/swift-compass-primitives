// Compass.Cardinal+Comparison.Protocol.swift
// Conformance of Compass.Cardinal to Comparison.Protocol — unconditional.
//
// The comparison witnesses (clockwise rank) live in the root. `Comparison.Protocol`
// aliases `Swift.Comparable`, so this declaration supplies both conformances.

public import Comparison_Primitives
public import Compass_Primitive

extension Compass.Cardinal: Comparison.`Protocol` {}
