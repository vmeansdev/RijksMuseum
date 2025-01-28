import Foundation
import RijksData
import RijksUI

enum OverviewState {
    case loading
    case loaded([Artwork])
    case error(Error)
}

@MainActor
protocol OverviewPresenterProtocol {
    func present(state: OverviewState)
}

final class OverviewPresenter: OverviewPresenterProtocol {
    weak var view: OverviewPresentable?

    func present(state: OverviewState) {
        switch state {
        case .loading:
            view?.displayLoading()
        case let .loaded(artworks):
            let collection = artworks.map {
                ArtworkViewModel(id: $0.id, title: $0.title, author: $0.principalOrFirstMaker, previewURL: URL(string: $0.webImage.url)!)
            }
            view?.displayArworks(collection)
        case let .error(error):
            view?.displayError(error)
        }
    }
}

