# DebugActions

![DebugActions](https://github.com/rockbruno/DebugActions/raw/master/Metadata/logo.png "DebugActions")

`DebugActions` is a framework that abstracts iOS 13's `UIContextMenuInteraction` APIs in order to enhance your `UIViews` with custom, debug-only actions accessible by force-touches. You can use this framework to super-charge views with useful helper actions that improve your daily debugging routine, like displaying the backend data that rendered a view or just copying something to the pasteboard.

## Usage

`DebugAction`'s APIs are available to all `UIViews`. It begins by defining a `DebugMenuInteractionDelegate` (which can be the view itself) that returns all the available actions for that interaction in the shape of an `UIKit` `UIMenuElement`:

```swift
extension LoggedUserView: DebugMenuInteractionDelegate {
    func copyUUID() -> UIMenuElement {
        return UIAction(title: "Copy UUID") { _ in
            // Copy the UUID to pasteboard
        }
    }

    func printLoginJSON() -> UIMenuElement {
        return UIAction(title: "Print the Backend's Login Response") { _ in
            // Print it!
        }
    }

    func debugActions() -> [UIMenuElement] {
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

## Asynchronous Actions

If your app supports **iOS 14**, you can also use the new `UIDeferredMenuElement` to create actions that are resolved asynchronously:

```swift
func serverInformation() -> UIMenuElement {
    return UIDeferredMenuElement { completion in
        // an Async task that fetches some information about a server:
        completion([printServerInformationAction(serverInfo)])
    }
}
```

This results in a menu element with a loading indicator that is replaced with the final actions once the completion handler is called.

![DebugActions Async](https://github.com/rockbruno/DebugActions/raw/master/Metadata/async.png "DebugActions")

## Installation

### Swift Package Manager

`.package(url: "https://github.com/rockbruno/DebugActions", .upToNextMinor(from: "0.2.0"))`

### CocoaPods

`pod 'DebugActions'`
