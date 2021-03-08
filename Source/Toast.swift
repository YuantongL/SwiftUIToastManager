//
//  Toast.swift
//  SwiftUIToastManager
//
//  Created by Lyt on 3/8/21.
//

import Foundation
import SwiftUI

/// Represent a toast
public protocol Toast {

    associatedtype Content : View
    associatedtype `Type`: ToastType

    /// The type of this toast
    var `type`: Type { get }

    /// The function to generate a view for this toast
    func makeView() -> Content
}

extension Toast {
    public func eraseToAnyToast() -> AnyToast {
        AnyToast(wrappedValue: self)
    }
}

/// Type erased toast
public struct AnyToast: Toast {
    public var `type`: some ToastType {
        wrappedType
    }

    private let wrappedType: AnyToastType
    private let wrappedContent: AnyView

    public init<T: Toast>(wrappedValue: T) {
        wrappedType = AnyToastType(wrappedValue: wrappedValue.type)
        wrappedContent = AnyView(wrappedValue.makeView())
    }

    public func makeView() -> AnyView {
        wrappedContent
    }
}

extension View {
    public func hasToasts(_ toasts: [AnyToast]) -> some View {
        BottomToastView(initialToasts: toasts) {
            self
        }
    }
}
