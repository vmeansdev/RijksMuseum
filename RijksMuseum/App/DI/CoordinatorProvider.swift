import NavigationKit

@MainActor
protocol CoordinatorProviderProtocol {
    func overviewCoordinator() -> OverviewCoordinatorProtocol
}

final class CoordinatorProvider: CoordinatorProviderProtocol {
    private let router: RouterProtocol
    private let serviceProvider: ServiceProviderProtocol

    init(router: RouterProtocol, serviceProvider: ServiceProviderProtocol) {
        self.router = router
        self.serviceProvider = serviceProvider
    }

    func overviewCoordinator() -> OverviewCoordinatorProtocol {
        OverviewCoordinator(router: router, serviceProvider: serviceProvider)
    }
}
