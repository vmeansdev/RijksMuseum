import NavigationKit
import RijksUI

@MainActor
protocol OverviewCoordinatorProtocol: Coordinator {
    func showArtworkDetails(_ artwork: ArtworkViewModel)
}

final class OverviewCoordinator: OverviewCoordinatorProtocol {
    private let router: RouterProtocol
    private let serviceProvider: ServiceProviderProtocol

    init(router: RouterProtocol, serviceProvider: ServiceProviderProtocol) {
        self.router = router
        self.serviceProvider = serviceProvider
    }

    func start() {
        let viewController = OverviewViewController.build(artworksService: serviceProvider.artworksService)
        router.push(NavigationDestination(viewController: viewController))
    }

    func showArtworkDetails(_ artwork: ArtworkViewModel) {
        // TODO: handle details opening
    }
}
