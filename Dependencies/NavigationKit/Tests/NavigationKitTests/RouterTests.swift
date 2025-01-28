@testable import NavigationKit
import XCTest

final class RouterTests: XCTestCase {
    @MainActor
    func test_push_pushesViewController() {
        let environment = Environment()
        let viewControllerToPush = UIViewController()
        let destination = NavigationDestination(viewController: viewControllerToPush)
        let sut = environment.makeSUT()
        let mockNavigationController = environment.mockNavigationController

        sut.push(destination)

        XCTAssert(mockNavigationController.pushViewControllerCalledOnce)
        let pushViewControllerInputValue = mockNavigationController.pushViewControllerInputValue
        XCTAssertNotNil(pushViewControllerInputValue)
        XCTAssertEqual(pushViewControllerInputValue?.0, viewControllerToPush)
        XCTAssert(pushViewControllerInputValue?.1 == true)
    }

    @MainActor
    func test_present_presentsViewController() {
        let environment = Environment()
        let viewControllerToPresent = UIViewController()
        let destination = NavigationDestination(viewController: viewControllerToPresent)
        let sut = environment.makeSUT()
        let mockNavigationController = environment.mockNavigationController

        sut.present(destination)

        XCTAssert(mockNavigationController.presentViewControllerCalledOnce)
        let presentViewControllerInputValue = mockNavigationController.presentViewControllerInputValue
        XCTAssertNotNil(presentViewControllerInputValue)
        XCTAssertEqual(presentViewControllerInputValue?.0, viewControllerToPresent)
        XCTAssert(presentViewControllerInputValue?.1 == true)
    }

    @MainActor
    func test_show_presentsAlertController() {
        let environment = Environment()
        let mockNavigationController = environment.mockNavigationController
        let sut = environment.makeSUT()
        let dialogTitle = "Test Title"
        let dialogMessage = "Test Message"
        let dialog = AlertDialogDestination(
            title: dialogTitle,
            message: dialogMessage,
            neutralAction: .init(title: "OK", handler: nil)
        )

        sut.show(dialog, animated: true)

        XCTAssert(mockNavigationController.presentViewControllerCalledOnce)
        let presentViewControllerInputValue = mockNavigationController.presentViewControllerInputValue
        XCTAssertNotNil(presentViewControllerInputValue)
        guard let presentedAlert = presentViewControllerInputValue?.0 as? UIAlertController else {
            XCTFail("Presented view controller is not an UIAlertController")
            return
        }

        XCTAssertEqual(presentedAlert.title, dialogTitle)
        XCTAssertEqual(presentedAlert.message, dialogMessage)
        XCTAssertEqual(presentedAlert.actions.count, 1)
        XCTAssertEqual(presentedAlert.actions.first?.title, "OK")
        XCTAssertEqual(presentedAlert.actions.first?.style, .default)
    }

    @MainActor
    func test_dismissPresented_whenPresentedViewControllerIsSet_dismissesViewController() {
        let environment = Environment()
        let mockNavigationController = environment.mockNavigationController
        let sut = environment.makeSUT()

        let presentedViewController = MockUIViewController()
        mockNavigationController.presentedViewControllerMock = presentedViewController

        sut.dismissPresented()

        XCTAssert(presentedViewController.dismissCalledOnce)
    }
}

@MainActor
private struct Environment {
    let mockNavigationController = MockNavigationController()

    func makeSUT() -> RouterProtocol {
        Router(navigationController: mockNavigationController)
    }
}
