import UIKit

final class MockUIViewController: UIViewController {
    private var dismissCalledTimes = 0
    var dismissCalledOnce: Bool {
        dismissCalledTimes == 1
    }
    var dismissCalled: Bool {
        dismissCalledTimes > 0
    }
    var dismissInputValue: (Bool, (() -> Void)?)?
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissCalledTimes += 1
        dismissInputValue = (flag, completion)
        super.dismiss(animated: flag, completion: completion)
    }
}

