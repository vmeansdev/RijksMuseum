import RijksData
import UIKit

extension OverviewViewController {
    static func build(artworksService: ArtworksServiceProtocol) -> UIViewController {
        let presenter = OverviewPresenter()
        let interactor = OverviewInteractor(presenter: presenter, service: artworksService)
        let viewController = OverviewViewController(interactor: interactor)
        presenter.view = viewController
        return viewController
    }
}

