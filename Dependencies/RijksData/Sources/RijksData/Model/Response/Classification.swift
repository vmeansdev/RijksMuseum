public struct Classification: Codable, Sendable, Equatable {
    public let iconClassIdentifier: [String]?

    public enum CodingKeys: String, CodingKey {
        case iconClassIdentifier = "iconClassIdentifier"
    }

    public init(iconClassIdentifier: [String]?) {
        self.iconClassIdentifier = iconClassIdentifier
    }
}
