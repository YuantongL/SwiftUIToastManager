//
//  ToastType.swift
//  Pods-SwiftUIToastManagerExample
//
//  Created by Lyt on 3/8/21.
//

import Foundation

/// Represent the type of a toast, each toast type should have a unique id
public protocol ToastType: Identifiable {
    /// Unique id of this toast type
    var id: String { get }
}

/// Type erased toast type
public struct AnyToastType: ToastType {
    public var id: String {
        wrappedId
    }

    private let wrappedId: String

    public init<T: ToastType>(wrappedValue: T) {
        wrappedId = wrappedValue.id
    }
}

extension AnyToastType: Hashable {}

extension AnyToastType: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
