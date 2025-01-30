import Foundation
import RijksData
import RijksUI

struct LoadedOverview: Equatable {
    let currentPage: Int
    let artworks: [Artwork]
    let hasMoreItems: Bool
}

typealias RetryAction = () -> Void

enum OverviewState: Equatable {
    case loading(isInitial: Bool)
    case loaded(LoadedOverview)
    case error(Error, RetryAction?)

    static func == (lhs: OverviewState, rhs: OverviewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case let (.loaded(lhs), .loaded(rhs)):
            return lhs == rhs
        case let (.error(lhs, _), .error(rhs, _)):
            return lhs.localizedDescription == rhs.localizedDescription
        default:
            return false
        }
    }
}

@MainActor
protocol OverviewPresenterProtocol {
    func present(state: OverviewState)
}

final class OverviewPresenter: OverviewPresenterProtocol {
    weak var view: OverviewPresentable?

    func present(state: OverviewState) {
        switch state {
        case let .loading(isInitial):
            view?.displayLoading(isInitial: isInitial)
        case let .loaded(overview):
            let collection: [ArtworkViewModel] = overview.artworks.compactMap {
                guard let previewURLString = $0.headerImage?.url, let previewURL = URL(string: previewURLString) else { return nil }
                return ArtworkViewModel(id: $0.id, title: $0.title, author: $0.principalOrFirstMaker, previewURL: previewURL)
            }
            view?.displayArworks(collection)
        case let .error(error, action):
            view?.displayError(ErrorViewModel(errorMessage: error.localizedDescription, retryAction: action))
        }
    }
}

