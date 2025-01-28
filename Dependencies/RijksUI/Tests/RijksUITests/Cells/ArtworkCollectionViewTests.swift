@testable import RijksUI
import XCTest
import SnapshotTesting

final class ArtworkCollectionViewTests: XCTestCase {
    func test_artworkCollectionViewCell_whenConfigured_thenDisplaysArtwork() {
        let environment = Environment()
        let size = CGSize(width: UIScreen.main.bounds.width, height: 250.0)
        let sut = environment.createSUT(size)
        environment.contentSizes.forEach {
            assertSnapshot(
                of: sut,
                size: size,
                interfaceStyle: .both,
                preferredContentSizeCategory: $0
            )
        }
    }
}

private struct Environment {
    let contentSizes: [UIContentSizeCategory] = [.medium, .accessibilityMedium, .accessibilityExtraLarge]

    func createSUT(_ size: CGSize) -> ArtworkCollectionViewCell {
        let cell = ArtworkCollectionViewCell(frame: CGRect(origin: .zero, size: size))
        cell.configure(with: ArtworkCollectionViewCell.PreviewData.viewModel)
        return cell
    }
}

