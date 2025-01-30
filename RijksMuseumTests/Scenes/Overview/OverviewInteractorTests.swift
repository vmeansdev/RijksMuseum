@testable import RijksMuseum
import RijksData
import XCTest

@MainActor
final class OverviewInteractorTests: XCTestCase {
   func test_viewDidLoad_shouldLoadArtworks() {
       let environment = Environment()
       environment.mockService.fetchCollectionCalledReturnValue = [Artwork.sample(id: "1")]
       let sut = environment.makeSUT()

       sut.viewDidLoad()
       let expectation = self.expectation(description: #function)
       DispatchQueue.main.asyncAfter(deadline: environment.asyncAfterDeadline()) {
           expectation.fulfill()
           XCTAssert(environment.mockService.fetchCollectionCalled)
           XCTAssertEqual(environment.mockPresenter.presentCalledTimes, 2)
           if case let .loaded(overview) = environment.mockPresenter.presentCalledInputValue {
               XCTAssertEqual(overview.currentPage, 1)
               XCTAssertTrue(overview.hasMoreItems)
               XCTAssertEqual(overview.artworks.count, 1)
           }
       }
       wait(for: [expectation], timeout: environment.expectationTimeout)
    }

    func test_viewWillUnload_shouldCancellCurrentTask() {
        let environment = Environment()
        environment.mockService.fetchCollectionCalledReturnValue = []
        let sut = environment.makeSUT()

        sut.viewDidLoad()
        XCTAssert(sut.currentTask?.isCancelled == false)

        sut.viewWillUnload()
        XCTAssert(sut.currentTask?.isCancelled == true)
    }

    func test_didSelectItem_shouldCallOutput() {
        let environment = Environment()
        let sut = environment.makeSUT()
        environment.mockService.fetchCollectionCalledReturnValue = [Artwork.sample(id: "1")]

        sut.viewDidLoad()

        let expectation = self.expectation(description: #function)
        DispatchQueue.main.asyncAfter(deadline: environment.asyncAfterDeadline()) {
            expectation.fulfill()
            sut.didSelect(item: 0)
            XCTAssert(environment.mockOutput.didSelectCalled)
            XCTAssertEqual(environment.mockOutput.didSelectCalledInputValue?.id, "1")
        }
        wait(for: [expectation], timeout: environment.expectationTimeout)
    }

    func test_didSelectItem_whenNoDataForItem_shouldNotCallOutput() {
        let environment = Environment()
        let sut = environment.makeSUT()

        sut.didSelect(item: 0)

        XCTAssertFalse(environment.mockOutput.didSelectCalled)
        XCTAssertNil(environment.mockOutput.didSelectCalledInputValue)
    }

    func test_loadMore_whenIsNotLoadingAndHasMore_shouldLoadNextPage() {
        let environment = Environment()
        let sut = environment.makeSUT()
        environment.mockService.fetchCollectionCalledReturnValue = [Artwork.sample(id: "1")]

        sut.loadMore()

        XCTAssert(sut.currentTask != nil)
        let expectation = self.expectation(description: #function)
        DispatchQueue.main.asyncAfter(deadline: environment.asyncAfterDeadline()) {
            expectation.fulfill()
            XCTAssert(environment.mockService.fetchCollectionCalled)
        }
        wait(for: [expectation], timeout: environment.expectationTimeout)
    }

    func test_canLoadMore_whenConditionIsNotMet_shouldReturnFalse() {
        let environment = Environment()
        let sut = environment.makeSUT()
        environment.mockService.fetchCollectionCalledReturnValue = [Artwork.sample(id: "1")]

        sut.viewDidLoad()

        let expectation = self.expectation(description: #function)
        DispatchQueue.main.asyncAfter(deadline: environment.asyncAfterDeadline()) {
            expectation.fulfill()
            XCTAssertFalse(sut.canLoadMore(item: 2))
        }
        wait(for: [expectation], timeout: environment.expectationTimeout)
    }

    func test_canLoadMore_whenConditionIsNotMet_shouldReturnTrue() {
        let environment = Environment()
        let sut = environment.makeSUT()
        environment.mockService.fetchCollectionCalledReturnValue = (0..<10).map{ Artwork.sample(id: "\($0)") }

        sut.viewDidLoad()

        let expectation = self.expectation(description: #function)
        DispatchQueue.main.asyncAfter(deadline: environment.asyncAfterDeadline()) {
            expectation.fulfill()
            XCTAssertFalse(sut.canLoadMore(item: 2))
            XCTAssert(sut.canLoadMore(item: 5))
        }
        wait(for: [expectation], timeout: environment.expectationTimeout)
    }
}

@MainActor
private struct Environment {
    let expectationTimeout: TimeInterval = 0.2
    let mockPresenter = MockOverviewPresenter()
    let mockService = MockArtworksService()
    let mockOutput = MockOverviewInteractorOutput()

    func makeSUT() -> OverviewInteractor {
        OverviewInteractor(
            presenter: mockPresenter,
            service: mockService,
            output: mockOutput
        )
    }

    func asyncAfterDeadline() -> DispatchTime {
        .now() + 0.1
    }
}

