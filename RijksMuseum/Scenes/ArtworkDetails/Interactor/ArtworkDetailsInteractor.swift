import RijksData

protocol ArtworkDetailsInteractorProtocol {
    @MainActor
    func viewDidLoad()
}

final class ArtworkDetailsInteractor: ArtworkDetailsInteractorProtocol {
    private(set) var artwork: Artwork
    private let artworksService: ArtworksServiceProtocol
    private let presenter: ArtworkDetailsPresenterProtocol
    private(set) var currentTask: Task<Void, Never>?

    init(
        artwork: Artwork,
        artworksService: ArtworksServiceProtocol,
        presenter: ArtworkDetailsPresenterProtocol
    ) {
        self.artwork = artwork
        self.artworksService = artworksService
        self.presenter = presenter
    }

    func viewDidLoad() {
        presenter.presentDetails(artwork: artwork)
        currentTask = Task {
            await fecthArtworkDetails()
        }
    }

    @MainActor
    private func fecthArtworkDetails() async {
        guard !Task.isCancelled else {
            return
        }
        do {
            let response = try await artworksService.fetchCollectionDetails(for: .nl, objectNumber: artwork.objectNumber)
            artwork = response
            presenter.presentDetails(artwork: response)
        } catch {
            presenter.presentError(error)
        }
    }
}

