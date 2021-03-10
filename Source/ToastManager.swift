//
//  ToastManager.swift
//  SwiftUIToastManager
//
//  Created by Lyt on 3/8/21.
//

import Foundation
import SwiftUI

/// Manages toasts appear/hiden on the screen
public class BottomToastManager: ObservableObject {

    public enum InsertPosition {
        case top
        case bottom
    }

    /// Stores all hidden toasts
    @Published
    private(set) var hiddenToastTypes: Set<AnyToastType> = []

    /// All toasts stored, show/hidden on the screen, managed like a stack
    @Published
    private(set) var toasts: [AnyToast] = []

    public init(toasts: [AnyToast]) {
        self.toasts = toasts
    }

    /// Insert a new toast to the top of the toast stack (new appears from the bottom of the view)
    public func insert(_ toast: AnyToast, position: InsertPosition = .bottom) {
        guard !toasts.contains(where: {
            $0 == toast
        }) else {
            return
        }
        withAnimation(.easeInOut(duration: 0.2)) {
            switch position {
            case .top:
                toasts.insert(toast, at: 0)
            case .bottom:
                toasts.append(toast)
            }
        }
    }

    /// Remove a toast from the toast stack
    public func remove<T: ToastType>(_ type: T) {
        withAnimation(.easeInOut(duration: 0.2)) {
            toasts.removeAll { existingToast in
                existingToast.type.id == type.id
            }
            hiddenToastTypes.remove(AnyToastType(wrappedValue: type))
        }
    }

    /// Temproarily hide a toast, this won't remove it from the stack
    public func hide<T: ToastType>(_ type: T) {
        _ = withAnimation(.easeInOut(duration: 0.2)) {
            hiddenToastTypes.insert(AnyToastType(wrappedValue: type))
        }
    }

    /// Show a hidden toast
    public func show<T: ToastType>(_ type: T) {
        _ = withAnimation(.easeInOut(duration: 0.2)) {
            hiddenToastTypes.remove(AnyToastType(wrappedValue: type))
        }
    }

}
