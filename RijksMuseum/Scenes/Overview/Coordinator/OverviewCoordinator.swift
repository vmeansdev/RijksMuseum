import RijksData
import UIKit

final class OverviewCoordinator: Coordinator {
    private let rootViewController: UINavigationController
    private let serviceProvider: ServiceProviderProtocol

    init(rootViewController: UINavigationController, serviceProvider: ServiceProviderProtocol) {
        self.rootViewController = rootViewController
        self.serviceProvider = serviceProvider
    }

    func start() {
        let viewController = OverviewViewController.build(artworksService: serviceProvider.artworksService, output: self)
        rootViewController.setViewControllers([viewController], animated: true)
    }
}

extension OverviewCoordinator: OverviewInteractorOutput {
    func didSelect(artwork: Artwork) {
        let viewController = ArtworkDetailsViewController.build(artwork: artwork, artworksService: serviceProvider.artworksService)
        rootViewController.pushViewController(viewController, animated: true)
    }
}
