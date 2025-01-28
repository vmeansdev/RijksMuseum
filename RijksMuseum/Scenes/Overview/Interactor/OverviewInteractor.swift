import Foundation
import RijksData
import RijksUI

protocol OverviewInteractorProtocol {
    @MainActor
    func viewDidLoad()
    func viewWillUnload()
    @MainActor
    func didSelect()
}

final class OverviewInteractor: OverviewInteractorProtocol {
    private let presenter: OverviewPresenterProtocol
    private let service: ArtworksServiceProtocol
    private(set) var currentTask: Task<Void, Never>?

    init(presenter: OverviewPresenterProtocol, service: ArtworksServiceProtocol) {
        self.presenter = presenter
        self.service = service
    }

    @MainActor
    func viewDidLoad() {
        currentTask = Task {
            await fetchCollection()
        }
    }

    func viewWillUnload() {
        currentTask?.cancel()
    }

    @MainActor
    func didSelect() {
        // TODO: handle selection
    }

    @MainActor
    private func fetchCollection() async {
        do {
            presenter.present(state: .loading)
            let artworks = try await service.fetchCollection(for: .nl, options: .init(page: 1, limit: 10))
            presenter.present(state: .loaded(artworks))
        } catch {
            presenter.present(state: .error(error))
        }
    }
}
