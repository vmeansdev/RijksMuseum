import Foundation
import RijksData
import RijksUI

struct LoadedOverview {
    let currentPage: Int
    let artworks: [Artwork]
    let hasMoreItems: Bool
}

enum OverviewState {
    case loading
    case loaded(LoadedOverview)
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
        case let .loaded(overview):
            let collection = overview.artworks.map {
                ArtworkViewModel(id: $0.id, title: $0.title, author: $0.principalOrFirstMaker, previewURL: URL(string: $0.webImage.url)!)
            }
            view?.displayArworks(collection)
        case let .error(error):
            view?.displayError(error)
        }
    }
}

