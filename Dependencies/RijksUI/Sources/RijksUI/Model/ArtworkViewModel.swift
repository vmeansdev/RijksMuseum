import Foundation

public struct ArtworkViewModel: Equatable, Hashable, Sendable {
    public let id: String
    public let title: String
    public let author: String
    public let previewURL: URL

    public init(id: String, title: String, author: String, previewURL: URL) {
        self.id = id
        self.title = title
        self.author = author
        self.previewURL = previewURL
    }
}

