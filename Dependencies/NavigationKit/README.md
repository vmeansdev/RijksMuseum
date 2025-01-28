# NavigationKit

NavigationKit is a lightweight and intuitive library designed for seamless navigation in iOS apps using UIKit. It provides a structured way to handle view controller transitions and dialogs, making it easier for developers to manage navigation flows in their applications.

## Features

- Simple, protocol-oriented design for defining navigation destinations.
- Support for push and modal presentations of view controllers.
- Easy-to-use dialog presentation with customizable alerts.
- Built-in handling for dismissing presented view controllers.


## Usage

### Defining Destinations

To define a destination, conform to the `Destination` protocol:

```swift
class MyViewController: UIViewController, Destination {
    var viewController: UIViewController {
        return self
    }
}
```

### Creating Dialogs

Use the `DialogDestination` protocol for dialog presentations, like alerts:

```swift
let dialog = AlertDialogDestination(title: "Title", message: "Message", neutralAction: DialogAction(title: "OK", handler: {
    print("OK tapped")
}))
```

### Implementing the Router

The `Router` class manages navigation. Initialize it with a `UINavigationController`:

```swift
let router = Router(navigationController: myNavigationController)
```

### Performing Navigation

You can push or present view controllers:

```swift
let destination = MyViewController()
router.push(destination) // Push on the navigation stack
router.present(destination) // Present modally
```

To show a dialog:

```swift
router.show(dialog)
```

To dismiss a presented view controller:

```swift
router.dismissPresented()
```

## Example

Here’s a quick example of how to use `NavigationKit` in your application controller:

```swift
class MainViewController: UIViewController {
    let router: Router

    init(navigationController: UINavigationController) {
        self.router = Router(navigationController: navigationController)
    }

    func navigateToNextScreen() {
        let nextScreen = MyViewController()
        router.push(nextScreen)
    }

    func showAlert() {
        let alertDialog = AlertDialogDestination(title: "Hello", message: "This is an alert.", neutralAction: DialogAction(title: "Close", handler: nil))
        router.show(alertDialog)
    }
}
```
