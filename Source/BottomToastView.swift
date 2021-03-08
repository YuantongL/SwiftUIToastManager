//
//  BottomToastView.swift
//  SwiftUIToastManager
//
//  Created by Lyt on 3/8/21.
//

import Foundation
import SwiftUI

struct BottomToastView<V: View>: View {

    private let content: V

    @StateObject
    private var toastManager: BottomToastManager

    @State
    private var hiddenToasts: Set<String> = []

    init(initialToasts: [AnyToast], @ViewBuilder content: () -> V) {
        _toastManager = .init(wrappedValue: BottomToastManager(toasts: initialToasts))
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .environmentObject(toastManager)

            VStack(spacing: 8) {
                ForEach(toastManager.toasts, id: \.self.type.id) { toast in
                    if !toastManager.hiddenToastTypes.contains { $0.id == toast.type.id } {
                        toast.makeView()
                            .transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                    }
                }
            }
            .padding()
        }
    }
}
