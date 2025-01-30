#if DEBUG
import RijksData
import SwiftUI
import UIKit

private struct MockArtworksService: ArtworksServiceProtocol {
    func fetchCollection(for culture: Culture, options: PaginationOptions) async throws -> [Artwork] {
        [Artwork.sample(id: "1"), Artwork.sample(id: "2"), Artwork.sample(id: "3")]
    }

    func fetchCollectionDetails(for culture: Culture, objectNumber: String) async throws -> Artwork {
        Artwork.sample(id: "1")
    }
}

private final class MockOutput: OverviewInteractorOutput {
    func didSelect(artwork: Artwork) {
        // no-op
    }
}

#Preview {
    UINavigationController(
        rootViewController: OverviewViewController.build(artworksService: MockArtworksService(), output: MockOutput())
    )
}
#endif

