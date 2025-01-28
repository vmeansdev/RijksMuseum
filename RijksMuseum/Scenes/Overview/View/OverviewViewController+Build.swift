import RijksData
import UIKit

extension OverviewViewController {
    static func build(
        artworksService: ArtworksServiceProtocol,
        output: OverviewInteractorOutput
    ) -> UIViewController {
        let presenter = OverviewPresenter()
        let interactor = OverviewInteractor(presenter: presenter, service: artworksService, output: output)
        let viewController = OverviewViewController(interactor: interactor)
        presenter.view = viewController
        return viewController
    }
}

