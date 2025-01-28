#if DEBUG
import SwiftUI
#Preview {
    UIViewPreview {
        let cell = ArtworkCollectionViewCell()
        cell.configure(with: ArtworkCollectionViewCell.PreviewData.viewModel)
        return cell
    }.frame(height: 250)
}

extension ArtworkCollectionViewCell {
    public enum PreviewData {
        static let viewModel = ArtworkViewModel(
            id: "1",
            title: "Coolest painting ever",
            author: "M.E. The painter",
            previewURL: URL(fileURLWithPath: Bundle.module.path(forResource: "pup", ofType: "jpg")!)
        )

        public static func viewModel(with id: String) -> ArtworkViewModel {
            ArtworkViewModel(id: id, title: viewModel.title, author: viewModel.author, previewURL: viewModel.previewURL)
        }
    }
}
#endif

