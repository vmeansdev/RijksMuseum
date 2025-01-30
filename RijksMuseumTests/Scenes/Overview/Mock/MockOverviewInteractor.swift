@testable import RijksMuseum

final class MockOverviewInteractor: OverviewInteractorProtocol {
    var viewDidLoadCalledTimes = 0
    var viewDidLoadCalledOnce: Bool {
        viewDidLoadCalledTimes == 1
    }
    var viewDidLoadCalled: Bool {
        viewDidLoadCalledTimes > 0
    }
    func viewDidLoad() {
        viewDidLoadCalledTimes += 1
    }

    var viewWillUnloadCalledTimes = 0
    var viewWillUnloadCalledOnce: Bool {
        viewWillUnloadCalledTimes == 1
    }
    var viewWillUnloadCalled: Bool {
        viewWillUnloadCalledTimes > 0
    }
    func viewWillUnload() {
        viewWillUnloadCalledTimes += 1
    }

    var didSelectItemCalledTimes = 0
    var didSelectItemCalledOnce: Bool {
        didSelectItemCalledTimes == 1
    }
    var didSelectItemCalled: Bool {
        didSelectItemCalledTimes > 0
    }
    var didSelectItemInputValue: Int?
    func didSelect(item: Int) {
        didSelectItemCalledTimes += 1
        didSelectItemInputValue = item
    }

    var loadMoreCalledTimes = 0
    var loadMoreCalledOnce: Bool {
        loadMoreCalledTimes == 1
    }
    var loadMoreCalled: Bool {
        loadMoreCalledTimes > 0
    }
    func loadMore() {
        loadMoreCalledTimes += 1
    }

    var canLoadMoreItemCalledTimes = 0
    var canLoadMoreItemCalledOnce: Bool {
        canLoadMoreItemCalledTimes == 1
    }
    var canLoadMoreItemCalled: Bool {
        canLoadMoreItemCalledTimes > 0
    }
    var canLoadMoreItemInputValue: Int?
    var canLoadMoreItemReturnValue: Bool!
    var canLoadMoreItemReturnClosure: ((Int) -> Bool)?
    func canLoadMore(item: Int) -> Bool {
        canLoadMoreItemCalledTimes += 1
        canLoadMoreItemInputValue = item
        return canLoadMoreItemReturnClosure.map { $0(item) } ?? canLoadMoreItemReturnValue
    }
}
