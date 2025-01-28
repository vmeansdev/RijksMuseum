import UIKit
import AppHttpKit
import RijksData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var rootNavigationController: UINavigationController!
    var dependenciesProvider: DependenciesProviderProtocol!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene), !isRunningTest() else { return }
        window = UIWindow(windowScene: windowScene)
        rootNavigationController = UINavigationController()
        dependenciesProvider = DependenciesProvider(
            window: window,
            rootNavigationController: rootNavigationController,
            windowConfigurator: WindowConfigurator(),
            navigationControllerConfigurator: NavigationControllerConfigurator()
        )
        dependenciesProvider.coordinatorProvider.overviewCoordinator().start()
    }
}

private func isRunningTest() -> Bool {
    NSClassFromString("XCTestCase") != nil
}
