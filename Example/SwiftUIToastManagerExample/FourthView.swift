//
//  FourthView.swift
//  SwiftUIToastManagerExample
//
//  Created by Lyt on 3/8/21.
//

import SwiftUI
import SwiftUIToastManager

struct FourthView: View {

    @EnvironmentObject
    private var toastManager: BottomToastManager
    
    var body: some View {
        Text("Fourth view, this view introduces toast #3, toast #3 only appear on this view")
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .padding()
            .onAppear {
                toastManager.insert(Toast3().eraseToAnyToast())
            }
            .onDisappear {
                toastManager.remove(ToastType3())
            }
    }
}

private struct ToastType3: ToastType {
    var id: String = "ToastType3"
}

private struct Toast3: Toast {
    let type = ToastType3()

    func makeView() -> some View {
        Text("This is toast #3")
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.yellow)
            .cornerRadius(10)
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
