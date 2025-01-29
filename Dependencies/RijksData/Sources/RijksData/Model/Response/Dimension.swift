public struct Dimension: Codable, Sendable {
    public let unit: String?
    public let type: String?
    public let precision: String?
    public let part: String?
    public let value: String?

    public enum CodingKeys: String, CodingKey {
        case unit = "unit"
        case type = "type"
        case precision = "precision"
        case part = "part"
        case value = "value"
    }

    public init(unit: String?, type: String?, precision: String?, part: String?, value: String?) {
        self.unit = unit
        self.type = type
        self.precision = precision
        self.part = part
        self.value = value
    }
}
