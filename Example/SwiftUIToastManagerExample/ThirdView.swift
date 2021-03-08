//
//  ThirdView.swift
//  SwiftUIToastManagerExample
//
//  Created by Lyt on 3/7/21.
//

import SwiftUI
import SwiftUIToastManager

struct ThirdView: View {
    
    @EnvironmentObject
    private var toastManager: BottomToastManager

    var body: some View {
        VStack {
            Text("ThirdView, this view shows toast #1, hides toast #2")
            NavigationLink("Go to FourthView", destination: FourthView())
        }
        .onAppear {
            toastManager.hide(ToastType2())
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
