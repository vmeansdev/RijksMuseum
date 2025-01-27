public struct CollectionResponse: Codable, Sendable {
    public let elapsedMilliseconds: Int
    public let count: Int
    public let artObjects: [Artwork]

    public enum CodingKeys: String, CodingKey {
        case elapsedMilliseconds = "elapsedMilliseconds"
        case count = "count"
        case artObjects = "artObjects"
    }

    public init(elapsedMilliseconds: Int, count: Int, artObjects: [Artwork]) {
        self.elapsedMilliseconds = elapsedMilliseconds
        self.count = count
        self.artObjects = artObjects
    }
}

