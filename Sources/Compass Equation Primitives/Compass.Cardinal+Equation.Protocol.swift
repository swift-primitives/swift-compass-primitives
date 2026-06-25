// Compass.Cardinal+Equation.Protocol.swift
// Conformance of Compass.Cardinal to Equation.Protocol — unconditional.
//
// Compass.Cardinal is a payload-less enum (implicitly Equatable); the `==` witness lives in
// the root (Compass.Cardinal.swift). On Swift 6.4+ Equation.Protocol is a typealias to
// Swift.Equatable per SE-0499. No gated stdlib shim (the implicit Equatable covers it).

public import Compass_Primitive
public import Equation_Primitives

extension Compass.Cardinal: Equation.`Protocol` {}
