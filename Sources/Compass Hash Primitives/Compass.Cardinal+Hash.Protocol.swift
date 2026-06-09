// Compass.Cardinal+Hash.Protocol.swift
// Conformance of Compass.Cardinal to Hash.Protocol — unconditional.
//
// Compass.Cardinal is a payload-less enum, so Swift provides Equatable/Hashable implicitly
// and the `hash(into:)` / `==` witnesses live in the type's own module. This conformance is
// therefore empty, and there is NO `#if swift(<6.4) extension … : Hashable {}` (the implicit
// Hashable already covers it).

public import Hash_Primitives
public import Compass_Primitive

extension Compass.Cardinal: Hash.`Protocol` {}
