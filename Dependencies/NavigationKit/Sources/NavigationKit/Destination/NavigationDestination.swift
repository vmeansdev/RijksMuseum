import UIKit

public class NavigationDestination: Destination {
    public let viewController: UIViewController

    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
