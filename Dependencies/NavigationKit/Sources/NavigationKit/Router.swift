import UIKit

@MainActor
public protocol RouterProtocol {
    func push(_ destination: Destination, animated: Bool)
    func present(_ destination: Destination, animated: Bool)
    func show(_ dialog: DialogDestination, animated: Bool)
    func dismissPresented()
}

public extension RouterProtocol {
    func push(_ destination: Destination) {
        push(destination, animated: true)
    }

    func present(_ destination: Destination) {
        present(destination, animated: true)
    }

    func show(_ dialog: DialogDestination) {
        show(dialog, animated: true)
    }
}

/// `Routable` implementation
/// Uses `UINavigationController` in order to navigate to `Destination`s
public class Router: RouterProtocol {
    // MARK: - Private properties

    private let navigationController: UINavigationController

    // MARK: - Initialization

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public methods

    public func push(_ destination: Destination, animated: Bool) {
        navigationController.pushViewController(destination.viewController, animated: animated)
    }

    public func present(_ destination: Destination, animated: Bool) {
        navigationController.present(destination.viewController, animated: animated, completion: nil)
    }

    public func show(_ dialog: DialogDestination, animated: Bool) {
        let alert = UIAlertController(title: dialog.title, message: dialog.message, preferredStyle: .alert)
        let action = UIAlertAction(title: dialog.neutralAction?.title, style: .default) { _ in dialog.neutralAction?.handler?() }
        alert.addAction(action)
        let presentAction = { [weak self] in self?.navigationController.present(alert, animated: animated) }
        if navigationController.presentedViewController == nil {
            presentAction()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                presentAction()
            }
        }
    }

    public func dismissPresented() {
        guard let viewController = navigationController.presentedViewController else { return }
        viewController.dismiss(animated: true, completion: nil)
    }
}
