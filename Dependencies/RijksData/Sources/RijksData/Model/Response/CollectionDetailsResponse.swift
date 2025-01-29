public struct CollectionDetailsResponse: Codable, Sendable {
    public let elapsedMilliseconds: Int
    public let artObject: Artwork

    public enum CodingKeys: String, CodingKey {
        case elapsedMilliseconds = "elapsedMilliseconds"
        case artObject = "artObject"
    }

    public init(elapsedMilliseconds: Int, artObject: Artwork) {
        self.elapsedMilliseconds = elapsedMilliseconds
        self.artObject = artObject
    }
}
