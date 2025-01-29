public struct ColorsWithNormalization: Codable, Sendable {
    public let originalHex: String
    public let normalizedHex: String

    public enum CodingKeys: String, CodingKey {
        case originalHex = "originalHex"
        case normalizedHex = "normalizedHex"
    }

    public init(originalHex: String, normalizedHex: String) {
        self.originalHex = originalHex
        self.normalizedHex = normalizedHex
    }
}
