import Kingfisher
import UIKit

public class ArtworkDetailsView: UIView, ConfigurableView, DetachableView {
    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let artistLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let containerView = UIView()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        addSubview(scrollView)

        imageView.contentMode = .scaleAspectFill
        scrollView.addSubview(imageView)
        scrollView.addSubview(containerView)

        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        containerView.addSubview(stackView)

        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        artistLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        artistLabel.adjustsFontForContentSizeCategory = true
        artistLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.numberOfLines = 0

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(artistLabel)
        stackView.addArrangedSubview(descriptionLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        [scrollView, imageView, containerView, stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),

            containerView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
        ])
    }

    public func configure(with viewModel: ArtworkDetailsViewModel) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: viewModel.imageURL, placeholder: viewModel.placeholderImage)
        titleLabel.text = viewModel.title
        artistLabel.text = viewModel.artist
        if let description = viewModel.description {
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
        }
    }

    public func onDetach() {
        imageView.kf.cancelDownloadTask()
    }
}

