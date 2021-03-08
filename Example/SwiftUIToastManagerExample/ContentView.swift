//
//  ContentView.swift
//  SwiftUIToastManagerExample
//
//  Created by Lyt on 3/7/21.
//

import SwiftUI
import SwiftUIToastManager

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    Text("Root View, this view shows toast #1 and #2")
                    NavigationLink("Go to SecondView", destination: SecondView())
                }
            }
            .hasToasts([Toast1().eraseToAnyToast(),
                        Toast2().eraseToAnyToast()])
            .tabItem {
                Label("Menu", systemImage: "list.dash")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ToastType1: ToastType {
    var id: String = "ToastType1"
}

struct Toast1: Toast {
    let type = ToastType1()

    func makeView() -> some View {
        Text("This is toast #1")
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.red)
            .cornerRadius(10)
    }
}

struct ToastType2: ToastType {
    let id: String = "ToastType2"
}

struct Toast2: Toast {
    let type = ToastType2()

    func makeView() -> some View {
        Text("This is toast #2")
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.blue)
            .cornerRadius(10)
    }
}
