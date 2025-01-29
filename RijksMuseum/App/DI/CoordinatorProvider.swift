import UIKit

@MainActor
protocol CoordinatorProviderProtocol {
    func overviewCoordinator() -> Coordinator
}

final class CoordinatorProvider: CoordinatorProviderProtocol {
    private let rootViewController: UINavigationController
    private let serviceProvider: ServiceProviderProtocol

    init(rootViewController: UINavigationController, serviceProvider: ServiceProviderProtocol) {
        self.rootViewController = rootViewController
        self.serviceProvider = serviceProvider
    }

    func overviewCoordinator() -> Coordinator {
        OverviewCoordinator(rootViewController: rootViewController, serviceProvider: serviceProvider)
    }
}
