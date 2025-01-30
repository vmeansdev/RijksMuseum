@testable import RijksMuseum
import RijksUI

final class MockOverviewPresentable: OverviewPresentable {
    var displayLoadingCalledTimes = 0
    var displayLoadingCalled: Bool {
        displayLoadingCalledTimes > 0
    }
    var displayLoadingCalledOnce: Bool {
        displayLoadingCalledTimes == 1
    }
    func displayLoading() {
        displayLoadingCalledTimes += 1
    }

    var displayArtworksCalledTimes = 0
    var displayArtworksCalled: Bool {
        displayArtworksCalledTimes > 0
    }
    var displayArtworksCalledOnce: Bool {
        displayArtworksCalledTimes == 1
    }
    var displayArtworksCalledInputValue: [ArtworkViewModel]?
    func displayArworks(_ artworks: [ArtworkViewModel]) {
        displayArtworksCalledTimes += 1
        displayArtworksCalledInputValue = artworks
    }

    var displayErrorCalledTimes = 0
    var displayErrorCalled: Bool {
        displayErrorCalledTimes > 0
    }
    var displayErrorCalledOnce: Bool {
        displayErrorCalledTimes == 1
    }
    var displayErrorCalledInputValue: ErrorViewModel?
    func displayError(_ error: ErrorViewModel) {
        displayErrorCalledTimes += 1
        displayErrorCalledInputValue = error
    }
}
