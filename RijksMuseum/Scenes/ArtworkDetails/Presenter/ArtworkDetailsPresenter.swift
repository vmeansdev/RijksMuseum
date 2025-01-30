import Foundation
import RijksData
import RijksUI

@MainActor
protocol ArtworkDetailsPresenterProtocol {
    func presentDetails(artwork: Artwork)
    func presentError(_ error: Error)
}

final class ArtworkDetailsPresenter: ArtworkDetailsPresenterProtocol {
    var view: ArtworkDetailsPresentable?

    func presentDetails(artwork: Artwork) {
        guard let imageURL = URL(string: artwork.headerImage?.url ?? artwork.webImage.url) else {
            return
        }
        let viewModel = ArtworkDetailsViewModel(
            imageURL: imageURL,
            placeholderImage: nil,
            title: artwork.title,
            artist: artwork.longTitle,
            description: artwork.description
        )
        view?.displayDetails(viewModel)
    }

    func presentError(_ error: any Error) {
        view?.displayError(.init(errorMessage: error.localizedDescription, retryAction: nil))
    }
}

