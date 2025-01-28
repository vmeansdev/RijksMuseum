import UIKit

class MockNavigationController: UINavigationController {
    private var pushViewControllerCalledTimes = 0
    var pushViewControllerCalledOnce: Bool {
        pushViewControllerCalledTimes == 1
    }
    var pushViewControllerCalled: Bool {
        pushViewControllerCalledTimes > 0
    }
    var pushViewControllerInputValue: (UIViewController, Bool)?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCalledTimes += 1
        pushViewControllerInputValue = (viewController, animated)
        super.pushViewController(viewController, animated: animated)
    }

    var presentedViewControllerMock: UIViewController?
    override var presentedViewController: UIViewController? {
        presentedViewControllerMock ?? super.presentedViewController
    }

    private var presentViewControllerCalledTimes = 0
    var presentViewControllerCalledOnce: Bool {
        presentViewControllerCalledTimes == 1
    }
    var presentViewControllerCalled: Bool {
        presentViewControllerCalledTimes > 0
    }
    var presentViewControllerInputValue: (UIViewController, Bool, (() -> Void)?)?
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentViewControllerCalledTimes += 1
        presentViewControllerInputValue = (viewControllerToPresent, flag, completion)
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }

    private var popViewControllerCalledTimes = 0
    var popViewControllerCalled: Bool {
        popViewControllerCalledTimes > 0
    }
    var popViewControllerCalledOnce: Bool {
        popViewControllerCalledTimes == 1
    }
    var popViewControllerInputValue: Bool?
    override func popViewController(animated: Bool) -> UIViewController? {
        popViewControllerCalledTimes += 1
        popViewControllerInputValue = animated
        return super.popViewController(animated: animated)
    }

    private var popToViewControllerCalledTimes = 0
    var popToViewControllerCalled: Bool {
        popToViewControllerCalledTimes > 0
    }
    var popToViewControllerCalledOnce: Bool {
        popToViewControllerCalledTimes == 1
    }
    var popToViewControllerInputValue: (UIViewController, Bool)?
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        popToViewControllerCalledTimes += 1
        popToViewControllerInputValue = (viewController, animated)
        return super.popToViewController(viewController, animated: animated)
    }

    private var popToRootViewControllerCalledTimes = 0
    var popToRootViewControllerCalled: Bool {
        popToRootViewControllerCalledTimes > 0
    }
    var popToRootViewControlllerCalledOnce: Bool {
        popToRootViewControllerCalledTimes == 1
    }
    var popToRootViewControllerInputValue: Bool?
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        popToRootViewControllerCalledTimes += 1
        popToRootViewControllerInputValue = animated
        return super.popToRootViewController(animated: animated)
    }

    private var setViewControllersCalledTimes = 0
    var setViewControllersCalled: Bool {
        setViewControllersCalledTimes > 0
    }
    var setViewControllersCalledOnce: Bool {
        setViewControllersCalledTimes == 1
    }
    var setViewControllersInputValue: ([UIViewController], Bool)?
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        setViewControllersCalledTimes += 1
        setViewControllersInputValue = (viewControllers, animated)
        super.setViewControllers(viewControllers, animated: animated)
    }
}
