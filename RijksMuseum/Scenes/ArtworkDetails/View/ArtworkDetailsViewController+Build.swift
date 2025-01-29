import RijksData
import UIKit

extension ArtworkDetailsViewController {
    static func build(artwork: Artwork, artworksService: ArtworksServiceProtocol) -> UIViewController {
        let presenter = ArtworkDetailsPresenter()
        let interactor = ArtworkDetailsInteractor(artwork: artwork, artworksService: artworksService, presenter: presenter)
        let viewController = ArtworkDetailsViewController(interactor: interactor)
        presenter.view = viewController
        return viewController
    }
}

