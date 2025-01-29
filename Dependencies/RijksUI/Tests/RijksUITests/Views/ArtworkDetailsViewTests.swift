@testable import RijksUI
import XCTest
import SnapshotTesting

final class ArtworkDetailsViewTests: XCTestCase {
    func test_artworkDetailsView_whenConfigured_displaysDetails() {
        let environment = Environment()
        let size = UIScreen.main.bounds.size
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

    func createSUT(_ size: CGSize) -> ArtworkDetailsView {
        let view = ArtworkDetailsView(frame: .init(origin: .zero, size: size))
        view.configure(with: ArtworkDetailsView.PreviewData.viewModel)
        return view
    }
}
