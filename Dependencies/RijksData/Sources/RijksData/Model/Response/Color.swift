public struct Color: Codable, Sendable {
    public let percentage: Int
    public let hex: String

    public enum CodingKeys: String, CodingKey {
        case percentage = "percentage"
        case hex = "hex"
    }

    public init(percentage: Int, hex: String) {
        self.percentage = percentage
        self.hex = hex
    }
}

