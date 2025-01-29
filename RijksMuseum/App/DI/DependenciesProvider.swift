import AppHttpKit
import NavigationKit
import UIKit

@MainActor
protocol DependenciesProviderProtocol {
    var coordinatorProvider: CoordinatorProviderProtocol { get }
    var serviceProvider: ServiceProviderProtocol { get }
}

final class DependenciesProvider: DependenciesProviderProtocol {
    let coordinatorProvider: CoordinatorProviderProtocol
    let serviceProvider: ServiceProviderProtocol

    init(
        window: UIWindow?,
        rootNavigationController: UINavigationController,
        windowConfigurator: WindowConfiguratorProtocol,
        navigationControllerConfigurator: NavigationControllerConfiguratorProtocol
    ) {
        serviceProvider = ServiceProvider(apiKey: Environment.apiKey, httpClient: HttpClient(baseURL: Environment.baseURLString))
        coordinatorProvider = CoordinatorProvider(rootViewController: rootNavigationController, serviceProvider: serviceProvider)
        navigationControllerConfigurator.configure(navigationController: rootNavigationController)
        windowConfigurator.configure(window: window, navigationController: rootNavigationController)
    }
}
