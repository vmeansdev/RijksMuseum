#if DEBUG
import RijksData
import SwiftUI
import UIKit

private struct MockArtworksService: ArtworksServiceProtocol {
    func fetchCollection(for culture: Culture, options: PaginationOptions) async throws -> [Artwork] {
        []
    }
}

#Preview {
    OverviewViewController.build(artworksService: MockArtworksService())
}
#endif

