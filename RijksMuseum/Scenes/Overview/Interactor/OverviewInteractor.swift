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
    private(set) var overview = LoadedOverview(currentPage: 0, artworks: [], hasMoreItems: true)
    private(set) var isLoading = false

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
        loadNextPage()
    }

    func viewWillUnload() {
        currentTask?.cancel()
    }

    @MainActor
    func didSelect(item: Int) {
        guard let artwork = overview.artworks[safe: item] else {
            return
        }
        output.didSelect(artwork: artwork)
    }

    @MainActor
    func loadMore() {
        guard !isLoading, overview.hasMoreItems else { return }
        loadNextPage()
    }

    func canLoadMore(item: Int) -> Bool {
        let nextBatchThreshold = max(overview.artworks.count - Constants.loadMoreThreshold, Constants.loadMoreThreshold)
        return item >= nextBatchThreshold && overview.hasMoreItems && !isLoading
    }

    private func loadNextPage() {
        currentTask?.cancel()
        currentTask = Task {
            await fetchCollection(page: overview.currentPage + 1)
        }
    }

    @MainActor
    private func fetchCollection(page: Int) async {
        guard !isLoading else { return }
        do {
            guard !Task.isCancelled else { return }
            isLoading = true
            presenter.present(state: .loading(isInitial: overview.currentPage == 0))
            let artworks = try await service.fetchCollection(for: .nl, options: .init(page: page, limit: Constants.artworksPerPage))
            let overview = LoadedOverview(currentPage: page, artworks: overview.artworks + artworks, hasMoreItems: !artworks.isEmpty)
            self.overview = overview
            presenter.present(state: .loaded(overview))
            isLoading = false
        } catch {
            isLoading = false
            presenter.present(state: .error(error, { [weak self] in self?.loadMore() }))
        }
    }

    private enum Constants {
        static let loadMoreThreshold = 5
        static let artworksPerPage = 10
    }
}
