import NavigationKit
import RijksData

final class OverviewCoordinator: Coordinator {
    private let router: RouterProtocol
    private let serviceProvider: ServiceProviderProtocol

    init(router: RouterProtocol, serviceProvider: ServiceProviderProtocol) {
        self.router = router
        self.serviceProvider = serviceProvider
    }

    func start() {
        let viewController = OverviewViewController.build(artworksService: serviceProvider.artworksService, output: self)
        router.push(NavigationDestination(viewController: viewController))
    }
}

extension OverviewCoordinator: OverviewInteractorOutput {
    func didSelect(artwork: Artwork) {
        
    }
}
