public struct Acquisition: Codable, Sendable {
    public let method: String
    public let date: String
    public let creditLine: String

    public enum CodingKeys: String, CodingKey {
        case method = "method"
        case date = "date"
        case creditLine = "creditLine"
    }

    public init(method: String, date: String, creditLine: String) {
        self.method = method
        self.date = date
        self.creditLine = creditLine
    }
}

