import NavigationKit

@MainActor
protocol CoordinatorProviderProtocol {
    func overviewCoordinator() -> Coordinator
}

final class CoordinatorProvider: CoordinatorProviderProtocol {
    private let router: RouterProtocol
    private let serviceProvider: ServiceProviderProtocol

    init(router: RouterProtocol, serviceProvider: ServiceProviderProtocol) {
        self.router = router
        self.serviceProvider = serviceProvider
    }

    func overviewCoordinator() -> Coordinator {
        OverviewCoordinator(router: router, serviceProvider: serviceProvider)
    }
}
