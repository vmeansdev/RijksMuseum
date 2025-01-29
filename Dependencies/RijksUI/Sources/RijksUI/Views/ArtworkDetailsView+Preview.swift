#if DEBUG
import SwiftUI

extension ArtworkDetailsView {
    public enum PreviewData {
        static let imageURL = URL(fileURLWithPath: Bundle.module.path(forResource: "pup", ofType: "jpg")!)
        static let imageData = try! Data(contentsOf: imageURL)
        static let image = UIImage(data: imageData)!
        static let title = "Kan met deksel"
        static let artist = "Adam van Vianen (1568 –1627), zilver, verguld, 1614"
        static let description = """
        Op deze kan is alles in beweging. Uit een stroperige massa doemen dierlijke en menselijke vormen op. Mogelijk wordt hier de oersoep (prima matera) verbeeld waaruit volgens de alchemisten het leven is ontstaan. Aan de binnenkant kruipen twee salamanders of hagedissen: dieren die ook voortkomen uit dood materiaal. Legt de kan een verband tussen de scheppende kracht van de kunstenaar en de scheppende kracht van de natuur?
        """
        static let viewModel = ArtworkDetailsViewModel(
            imageURL: imageURL,
            placeholderImage: image,
            title: title,
            artist: artist,
            description: description
        )
        static let frame = CGRect(origin: .zero, size: UIScreen.main.bounds.size)
    }
}

#Preview {
    UIViewPreview {
        let view = ArtworkDetailsView(frame: ArtworkDetailsView.PreviewData.frame)
        view.configure(with: ArtworkDetailsView.PreviewData.viewModel)
        return view
    }.frame(
        width: ArtworkDetailsView.PreviewData.frame.width,
        height: ArtworkDetailsView.PreviewData.frame.height
    )
}
#endif
