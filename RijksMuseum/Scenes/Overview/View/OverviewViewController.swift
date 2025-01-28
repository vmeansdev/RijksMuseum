import RijksUI
import UIKit

@MainActor
protocol OverviewPresentable: AnyObject {
    func displayLoading()
    func displayArworks(_ artworks: [ArtworkViewModel])
    func displayError(_ error: Error)
}

final class OverviewViewController: UIViewController, OverviewPresentable {
    // MARK: - Properties
    private let interactor: OverviewInteractorProtocol
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionLayout())
    private lazy var dataSource: UICollectionViewDiffableDataSource<Int, ArtworkViewModel> = {
        UICollectionViewDiffableDataSource<Int, ArtworkViewModel>(collectionView: collectionView) { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(ArtworkCollectionViewCell.self, for: indexPath)
            (cell as? ArtworkCollectionViewCell)?.configure(with: item)
            return cell
        }
    }()

    // MARK: - Initialization
    init(interactor: OverviewInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rijksmuseum"
        navigationItem.largeTitleDisplayMode = .automatic
        view.backgroundColor = .systemBackground
        makeLayout()
        interactor.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        interactor.viewWillUnload()
    }

    // MARK: - OverviewPresentable
    func displayLoading() {
        // TODO: handle loading displaying
    }

    func displayArworks(_ artworks: [ArtworkViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, ArtworkViewModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(artworks)
        dataSource.apply(snapshot)
    }

    func displayError(_ error: Error) {
        // TODO: handle error displaying
    }
}

// MARK: - Layout configuration
private extension OverviewViewController {
    func makeCollectionLayout() -> UICollectionViewLayout {
        let numberOfColumns: CGFloat = 1  // Number of columns
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / numberOfColumns), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .zero // Set spacing between items

        // Define group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .zero
        section.interGroupSpacing = 0 // Spacing between groups

        return UICollectionViewCompositionalLayout(section: section)
    }

    func makeLayout() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        collectionView.registerCell(ArtworkCollectionViewCell.self)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

// MARK: - UICollectionViewDelegate
extension OverviewViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? CollectionViewDetachable)?.onDetach()
    }
}
