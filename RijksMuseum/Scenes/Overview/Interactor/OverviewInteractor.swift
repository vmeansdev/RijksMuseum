import Foundation
import RijksData
import RijksUI

protocol OverviewInteractorProtocol {
    @MainActor
    func viewDidLoad()
    func viewWillUnload()
    @MainActor
    func didSelect(item: Int)
    @MainActor
    func loadMore()
    @MainActor
    func canLoadMore(item: Int) -> Bool
}

protocol OverviewInteractorOutput: AnyObject {
    @MainActor
    func didSelect(artwork: Artwork)
}

final class OverviewInteractor: OverviewInteractorProtocol {
    private let presenter: OverviewPresenterProtocol
    private let service: ArtworksServiceProtocol
    private let output: OverviewInteractorOutput
    private(set) var currentTask: Task<Void, Never>?

    private var overview = LoadedOverview(currentPage: 0, artworks: [], hasMoreItems: true)
    private var isLoading = false

    init(
        presenter: OverviewPresenterProtocol,
        service: ArtworksServiceProtocol,
        output: OverviewInteractorOutput
    ) {
        self.presenter = presenter
        self.service = service
        self.output = output
    }

    @MainActor
    func viewDidLoad() {
        currentTask = Task {
            await fetchCollection(page: 1)
        }
    }

    func viewWillUnload() {
        currentTask?.cancel()
    }

    @MainActor
    func didSelect(item: Int) {
        let artwork = overview.artworks[item]
        output.didSelect(artwork: artwork)
    }

    @MainActor
    func loadMore() {
        guard !isLoading, overview.hasMoreItems else { return }
        currentTask = Task {
            await fetchCollection(page: overview.currentPage + 1)
        }
    }

    func canLoadMore(item: Int) -> Bool {
        overview.artworks.count - 5 <= item && overview.hasMoreItems
    }

    @MainActor
    private func fetchCollection(page: Int) async {
        guard !isLoading else { return }
        do {
            guard !Task.isCancelled else { return }
            isLoading = true
            presenter.present(state: .loading)
            let artworks = try await service.fetchCollection(for: .nl, options: .init(page: page, limit: 10))
            let overview = LoadedOverview(currentPage: page, artworks: overview.artworks + artworks, hasMoreItems: !artworks.isEmpty)
            self.overview = overview
            presenter.present(state: .loaded(overview))
            isLoading = false
        } catch {
            isLoading = false
            presenter.present(state: .error(error))
        }
    }
}
