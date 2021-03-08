
# SwiftUIToastManager

### What it can do?
SwiftUIToastManager is a tool to manage the toast views (a card came from bottom of the screen) on the screen. You can add/remove, hide/show toast cards and they can stay on the screen while navigate through the app.

<p align="center">
  <img align="center" height="500" src="Github/SwiftUIToastManager.gif">
</p>

### Include it in your project

- Cocoapod: Add `pod 'SwiftUIToastManager'` to your Podfile

### Usage

- To initialize a view that has toasts
```
NavigationView {
    ... Your view code
}
.hasToasts([Toast1().eraseToAnyToast(), Toast2().eraseToAnyToast()])
```

- To hide a toast on a view
```
struct MyView: View {

    @EnvironmentObject
    private var toastManager: BottomToastManager

    var body: some View {
        VStack {
          ... Your view code
        }
        .onAppear {
            toastManager.hide(ToastType1())
        }
    }
}
```

- To show a toast (bring back a toast already initialed) is similar to hide
```
toastManager.show(ToastType1())
```

- To insert a toast to the toast stack from a view
```
.onAppear {
    toastManager.insert(Toast3().eraseToAnyToast())
}
```

- To remove a toast from the stack permanently is similar to insert
```
toastManager.remove(ToastType3())
```

Look at the /Example for a simple implementation.

### License
This repository is under MIT license. [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
