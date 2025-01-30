@testable import RijksMuseum

final class MockOverviewPresenter: OverviewPresenterProtocol {
    var presentCalledTimes = 0
    var presentCalledOnce: Bool {
        presentCalledTimes == 1
    }
    var presentCalled: Bool {
        presentCalledTimes > 0
    }
    var presentCalledInputValue: OverviewState?
    func present(state: OverviewState) {
        presentCalledTimes += 1
        presentCalledInputValue = state
    }
}
