import RijksUI
import UIKit

@MainActor
protocol ArtworkDetailsPresentable: AnyObject {
    func displayDetails(_ viewModel: ArtworkDetailsViewModel)
    func displayError(_ error: ErrorViewModel)
}

final class ArtworkDetailsViewController: UIViewController {
    private let interactor: ArtworkDetailsInteractorProtocol

    var myView: ArtworkDetailsView {
        return view as! ArtworkDetailsView
    }

    init(interactor: ArtworkDetailsInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = ArtworkDetailsView()
        view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        interactor.viewWillUnload()
        if isMovingFromParent {
            myView.onDetach()
        }
    }
}

extension ArtworkDetailsViewController: ArtworkDetailsPresentable {
    func displayDetails(_ viewModel: ArtworkDetailsViewModel) {
        title = viewModel.title
        myView.configure(with: viewModel)
    }

    func displayError(_ error: ErrorViewModel) {
        hideErrorIfNeeded()
        attach(ErrorViewController(viewModel: error))
    }

    private func hideErrorIfNeeded() {
        (children.last as? ErrorViewController)?.detach()
    }
}
