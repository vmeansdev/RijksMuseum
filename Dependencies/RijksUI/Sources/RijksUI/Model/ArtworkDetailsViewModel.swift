import Foundation
import UIKit

public struct ArtworkDetailsViewModel: Sendable {
    public let imageURL: URL
    public let placeholderImage: UIImage?
    public let title: String
    public let artist: String
    public let description: String?

    public init(imageURL: URL, placeholderImage: UIImage?, title: String, artist: String, description: String?) {
        self.imageURL = imageURL
        self.placeholderImage = placeholderImage
        self.title = title
        self.artist = artist
        self.description = description
    }
}

