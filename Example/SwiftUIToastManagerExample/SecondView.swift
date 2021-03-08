//
//  SecondView.swift
//  SwiftUIToastManagerExample
//
//  Created by Lyt on 3/7/21.
//

import SwiftUI
import SwiftUIToastManager

struct SecondView: View {

    @EnvironmentObject
    private var toastManager: BottomToastManager

    @State
    private var showingModal = false

    var body: some View {
        VStack {
            Text("SecondView, this view shows toast #1 and #2")
            NavigationLink("Navigate to ThirdView", destination: ThirdView())
                .padding(.bottom)

            Text("Modal Link")
            Button {
                showingModal.toggle()
            } label: {
                Text("Show Modal")
            }
        }
        .onAppear {
            toastManager.show(ToastType2())
        }
        .sheet(isPresented: $showingModal) {
            Text("Modal should cover all toasts.")
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
