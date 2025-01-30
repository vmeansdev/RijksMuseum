@testable import RijksMuseum
import RijksData

final class MockOverviewInteractorOutput: OverviewInteractorOutput {
    var didSelectCalledTimes = 0
    var didSelectCalled: Bool {
        didSelectCalledTimes > 0
    }
    var didSelectCalledOnce: Bool {
        didSelectCalledTimes == 1
    }
    var didSelectCalledInputValue: Artwork?
    func didSelect(artwork: Artwork) {
        didSelectCalledTimes += 1
        didSelectCalledInputValue = artwork
    }
}
