import Kingfisher
import UIKit

public class ArtworkCollectionViewCell: CollectionViewCell<ArtworkViewModel>, CollectionViewDetachable {
    private let paintingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        return label
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 1
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(paintingImageView)
        contentView.addSubview(overlayView)
        overlayView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(authorLabel)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        [paintingImageView, overlayView, stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            paintingImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            paintingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            paintingImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            paintingImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            overlayView.topAnchor.constraint(equalTo: contentView.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            stackView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -8)
        ])
    }

    public override func configure(with viewModel: ArtworkViewModel) {
        paintingImageView.kf.indicatorType = .activity
        paintingImageView.kf.setImage(with: viewModel.previewURL)
        titleLabel.text = viewModel.title
        titleLabel.accessibilityLabel = viewModel.title
        authorLabel.text = viewModel.author
        authorLabel.accessibilityLabel = viewModel.author
    }

    public func onDetach() {
        paintingImageView.kf.cancelDownloadTask()
    }
}
