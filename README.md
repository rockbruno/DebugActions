# DebugActions

![DebugActions](https://github.com/rockbruno/DebugActions/raw/master/Metadata/logo.png "DebugActions")

`DebugActions` is a framework that abstracts iOS 13's `UIContextMenuInteraction` APIs in order to enhance your `UIViews` with custom, debug-only actions accessible by force-touches. You can use this framework to super-charge views with useful helper actions that improve your daily debugging routine, like displaying the backend data that rendered a view or just copying something to the pasteboard.

## Usage

`DebugActions` APIs are available to all `UIViews`. It begins by defining a `DebugMenuInteractionDelegate` that returns the available actions (which can be the view itself:)

```swift
extension LoggedUserView: DebugMenuInteractionDelegate {
    func copyUUID() -> DebugAction {
        return .init(title: "Copy UUID") { _ in
            // Copy the UUID to pasteboard
        }
    }

    func printLoginJSON() -> DebugAction {
        return .init(title: "Print the Backend's Login Response") { _ in
            // Print it!
        }
    }

    func debugActions() -> [DebugAction] {
        #if DEBUG // Make sure to provide them only in developer builds!
        return [copyUUID(), printLoginJSON()]
        #else
        return []
        #endif
    }
}
```

Now, all you have to do is enable the debug actions in your view!

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    loggedUserView.enableDebugActionsInteraction()
}
```

## Installation

### Swift Package Manager

`.package(url: "https://github.com/rockbruno/DebugActions", .upToNextMinor(from: "0.1.0"))`

### CocoaPods

`pod 'DebugActions'`
